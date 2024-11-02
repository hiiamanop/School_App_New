// auth_controller.dart
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_super_app/components/navbar.dart';
import 'package:school_super_app/config/config.dart';
import 'package:school_super_app/pages/splashPage.dart';
import 'package:school_super_app/themes/theme.dart';
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isLoading = false.obs;

  Future<void> login() async {
    var url = Uri.parse(Config().loginUrl);

    if (email.text.isEmpty || password.text.isEmpty) {
      _showError("Email dan password tidak boleh kosong");
      return;
    }

    try {
      isLoading.value = true;
      
      final response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email.text,
          'password': password.text,
        }),
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('Koneksi timeout. Periksa koneksi internet Anda.');
        },
      );

      print('Login Response: ${response.body}');
      
      Map<String, dynamic> responseDecode;
      try {
        responseDecode = json.decode(response.body);
      } catch (e) {
        throw Exception('Invalid response format from server');
      }

      if (response.statusCode == 200 && responseDecode['status'] == 'success') {
        await _handleSuccessfulLogin(responseDecode);
      } else {
        throw Exception(responseDecode["message"] ?? "Login gagal");
      }
    } on SocketException catch (e) {
      _showError("Tidak dapat terhubung ke server. Periksa koneksi internet Anda.");
    } on TimeoutException catch (e) {
      _showError(e.message ?? "Koneksi timeout");
    } on FormatException catch (e) {
      _showError("Format response tidak valid");
    } catch (e) {
      _showError(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Perbaikan pada method _handleSuccessfulLogin
  Future<void> _handleSuccessfulLogin(Map<String, dynamic> response) async {
    try {
      var user = response['data'];
      var userId = response['user_id'].toString();

      // Simpan data user satu per satu
      await SpUtil.putString("id_user", userId);
      await SpUtil.putString("nama_user", user["name"]);
      await SpUtil.putString("email_user", user["email"]);
      await SpUtil.putString("nomor_induk", user["nomor_induk"]);
      await SpUtil.putString("tahun_masuk", user["tahun_masuk"]);
      await SpUtil.putInt("role_id", user["role_id"]);

      print('Saved User ID: ${SpUtil.getString("id_user")}');

      Get.offAll(() => Navbar(userId: userId));
      _showSuccess("Login berhasil");
    } catch (e) {
      throw Exception("Gagal menyimpan data pengguna: ${e.toString()}");
    }
  }

  void _showError(String message) {
    Get.snackbar(
      "Error",
      message,
      backgroundColor: redColor,
      colorText: whiteColor,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }

  void _showSuccess(String message) {
    Get.snackbar(
      "Success",
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }

  Future<void> logout() async {
    try {
      await SpUtil.clear();
      Get.offAll(() => SplashPage());
      _showSuccess("Logout berhasil");
    } catch (e) {
      print('Error during logout: $e');
      _showError("Gagal melakukan logout");
    }
  }
}