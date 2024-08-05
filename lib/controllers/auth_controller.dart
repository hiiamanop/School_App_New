import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_super_app/config/config.dart';
import 'package:school_super_app/pages/homePage.dart';
import 'package:school_super_app/pages/splashPage.dart';
import 'package:school_super_app/themes/theme.dart';
import 'package:sp_util/sp_util.dart';


class AuthController extends GetxController {
  // Text editing controllers for input fields
  TextEditingController email = TextEditingController(
      text: SpUtil.getString("email") ?? "");
  TextEditingController password = TextEditingController(
      text: SpUtil.getString("password") ?? "");

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

      SpUtil.putString("email", email.text);
      SpUtil.putString("password", password.text);

      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        SpUtil.putInt("id_user", responseDecode["data"]["id"]);
        SpUtil.putString("nama_user", responseDecode["data"]["name"]);
        SpUtil.putString("email_user", responseDecode["data"]["email"]);
        SpUtil.putString("telepon_user", responseDecode["data"]["telepon"]);

        isLoading.value = false;
        Get.offAll(HomePage());
      } else {
        isLoading.value = false;
        Get.snackbar("Error", responseDecode["message"],
            backgroundColor: redColor,
            colorText: whiteColor,
            snackPosition: SnackPosition.TOP,
            margin: EdgeInsets.all(10));
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString(),
          backgroundColor: redColor,
          colorText: whiteColor,
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(10));
    }
  }

  // Function for user logout
  Future<void> logout() async {
    var url = Uri.parse(Config().urlLogout);

    try {
      final response = await http.get(url);
      var responseDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        SpUtil.remove("id_user");
        SpUtil.remove("nama_user");
        SpUtil.remove("email_user");
        SpUtil.remove("telepon_user");

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
