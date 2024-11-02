import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_super_app/config/config.dart';
import 'package:sp_util/sp_util.dart';

class EnrollController extends GetxController {
  final String userId;
  RxList enrolledClasses = [].obs;
  RxBool isLoading = false.obs;

  EnrollController({required this.userId});

  @override
  void onInit() {
    super.onInit();
    fetchEnrolledClasses();
  }

  Future<void> enrollToClass(String enrollCode) async {
    try {
      isLoading.value = true;

      // Log request details
      print('Enrolling with code: $enrollCode for user: $userId');
      print('Enroll URL: ${Config().baseUrl}/api/enroll');

      final response = await http
          .post(
        Uri.parse('${Config().baseUrl}/api/enroll'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'code_enroll': enrollCode,
          'user_id': userId,
        }),
      )
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('Koneksi timeout saat mendaftar kelas');
        },
      );

      print('Enroll Response Status Code: ${response.statusCode}');
      print('Enroll Response Body: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        Get.snackbar(
          'Sukses',
          'Berhasil mendaftar ke kelas',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );

        // Delay sebentar sebelum fetch untuk memastikan data sudah terupdate di server
        await Future.delayed(const Duration(milliseconds: 500));
        await fetchEnrolledClasses();
      } else {
        throw Exception(data['message'] ?? 'Gagal mendaftar ke kelas');
      }
    } catch (e) {
      print('Error in enrollToClass: $e');
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchEnrolledClasses() async {
    try {
      isLoading.value = true;

      // Log request details
      print('Fetching classes for user: $userId');
      print('Fetch URL: ${Config().baseUrl}/api/enrolled-classes/$userId');

      final response = await http.get(
        Uri.parse('${Config().baseUrl}/api/enrolled-classes/$userId'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw TimeoutException('Koneksi timeout saat mengambil data kelas');
        },
      );

      print('Fetch Classes Response Status Code: ${response.statusCode}');
      print('Fetch Classes Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          enrolledClasses.value = data['data'];
          print('Successfully fetched ${enrolledClasses.length} classes');
        } else {
          throw Exception(data['message'] ?? 'Gagal mengambil data kelas');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetchEnrolledClasses: $e');
      Get.snackbar(
        'Error',
        'Gagal mengambil data kelas: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      // Set empty list jika terjadi error
      enrolledClasses.value = [];
    } finally {
      isLoading.value = false;
    }
  }

  // Helper method untuk retry fetch jika gagal
  Future<void> retryFetch() async {
    await fetchEnrolledClasses();
  }

  Future<void> unEnrollFromClass(String classId) async {
    try {
      isLoading.value = true;

      final response = await http.delete(
        Uri.parse('${Config().baseUrl}/api/unenroll/$classId'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      print('Unenroll Response: ${response.body}');

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 'success') {
        Get.snackbar(
          'Sukses',
          'Berhasil keluar dari kelas',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        await fetchEnrolledClasses(); // Refresh the list
      } else {
        throw Exception(data['message'] ?? 'Gagal keluar dari kelas');
      }
    } catch (e) {
      print('Error in unEnrollFromClass: $e');
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
