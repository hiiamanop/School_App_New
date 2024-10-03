import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_super_app/components/navbar.dart';
import 'package:school_super_app/config/config.dart';
import 'package:school_super_app/pages/splashPage.dart';
import 'package:school_super_app/themes/theme.dart';
import 'package:sp_util/sp_util.dart';

class AuthController extends GetxController {
  // Text editing controllers for input fields
  TextEditingController email =
      TextEditingController(text: SpUtil.getString("email") ?? "");
  TextEditingController password =
      TextEditingController(text: SpUtil.getString("password") ?? "");

  // RxBool to track loading state
  RxBool isLoading = false.obs;

  // Function for user login
  Future<void> login() async {
    var url = Uri.parse(Config().urlLogin);

    try {
      isLoading.value = true;
      final response = await http.post(url, body: {
        'email': email.text,
        'password': password.text,
      });

      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200 && responseDecode['success'] == true) {
        var user = responseDecode['data']; // Accessing 'data' instead of 'user'

        SpUtil.putString("email", email.text);
        SpUtil.putString("password", password.text);
        SpUtil.putInt("id_user", user["id"]);
        SpUtil.putString("nama_user", user["name"]);
        SpUtil.putString("email_user", user["email"]);
        SpUtil.putString("nomor_induk", user["nomor_induk"]);
        SpUtil.putString("tahun_masuk", user["tahun_masuk"]);

        isLoading.value = false;
        Get.offAll(Navbar());
      } else {
        isLoading.value = false;
        Get.snackbar("Error", responseDecode["message"] ?? "Unknown error",
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  // Function for user logout
  Future<void> logout() async {
    var url = Uri.parse(Config().urlLogout);

    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${SpUtil.getString("access_token")}'
      });
      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        SpUtil.remove("id_user");
        SpUtil.remove("nama_user");
        SpUtil.remove("email_user");
        SpUtil.remove("nomor_induk");
        SpUtil.remove("tahun_masuk");
        SpUtil.remove("access_token");

        Get.snackbar("Success", responseDecode["message"],
            backgroundColor: greenColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));

        Get.offAll(SplashPage());
      } else {
        Get.snackbar("Error", responseDecode['message'],
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          backgroundColor: redColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }
}
