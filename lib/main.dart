import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_super_app/auth/login.dart';
import 'package:school_super_app/pages/homePage.dart';
import 'package:school_super_app/pages/profilePage.dart';
import 'package:school_super_app/pages/splashPage.dart';
import 'package:sp_util/sp_util.dart';

void main() async {
  // Pastikan binding Flutter sudah diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi SpUtil
  await SpUtil.getInstance();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Ganti MaterialApp dengan GetMaterialApp
      title: 'School App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [ // Gunakan getPages sebagai pengganti routes
        GetPage(
          name: '/',
          page: () => SplashPage(),
        ),
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(
            userId: Get.arguments as String,
          ),
        ),
        GetPage(
          name: '/profile',
          page: () => ProfilePage(
            userId: Get.arguments as String,
          ),
        ),
      ],
      defaultTransition: Transition.fade, // Animasi transisi default
      debugShowCheckedModeBanner: false, // Hapus banner debug
      // Inisialisasi binding jika diperlukan
      initialBinding: BindingsBuilder(() {
        // Register controllers yang dibutuhkan secara global
      }),
      // Handler untuk error navigasi
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ),
      ),
    );
  }
}