import 'package:flutter/material.dart';
import 'package:school_super_app/auth/login.dart';
import 'package:school_super_app/components/navbar.dart';
import 'package:school_super_app/pages/Kelas/Input_Kelas.dart';
import 'package:school_super_app/pages/homePage.dart';
import 'package:school_super_app/pages/splashPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: SplashPage(),
    );
  }
}
