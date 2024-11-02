import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:school_super_app/components/navbar.dart';
import 'package:school_super_app/config/config.dart';
import 'dart:convert';
import 'package:school_super_app/themes/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void>  _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse(Config().loginUrl), // Menggunakan URL dari config.dart
      body: {
        'email': _emailController.text,
        'password': _passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['status'] == 'success') {
        setState(() {
          _isLoading = false;
        });
        // Pindah ke halaman profil dan kirim userId sebagai string
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Navbar(userId: data['user_id'].toString()),
          ),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        Get.snackbar("Error", "Invalid credentials", backgroundColor: Colors.red);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      Get.snackbar("Error", "Login failed", backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 50, 25, 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: whiteColor,
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('asset/images/logo sekolah.png'),
                    width: 100,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text("Email", style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukan Email",
                      hintStyle: greyTextStyle,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("Password", style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor),
                      ),
                      hintText: "Masukan Password",
                      hintStyle: greyTextStyle,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Lupa Password",
                        style: redTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: redColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Button login
                  Container(
                    height: 60,
                    width: 250,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: bgColor,
                      ),
                      onPressed: _login,
                      child: _isLoading
                          ? CircularProgressIndicator(color: whiteColor)
                          : Text(
                              "Masuk",
                              style: whiteTextStyle,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
