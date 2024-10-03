import 'package:flutter/material.dart';
import 'package:school_super_app/controllers/auth_controller.dart';
import 'package:school_super_app/themes/theme.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // buat variable untuk memanggil auth_contorller yang sudah dibuat
    final authC = Get.put(AuthController());

    return Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: EdgeInsets.fromLTRB(25, 50, 25, 30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: whiteColor),
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text("Email",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: authC.email,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        hintText: "Masukan Email",
                        hintStyle: greyTextStyle),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Password",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: authC.password,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        hintText: "Masukan Password",
                        hintStyle: greyTextStyle),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // lupa password?
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

                  SizedBox(
                    height: 20,
                  ),

                  // button login
                  Obx(() => Container(
                        height: 60,
                        width: 250,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: bgColor,
                          ),
                          onPressed: () {
                            authC.login();
                          },
                          child: authC.isLoading == true
                              ? CircularProgressIndicator(
                                  color: whiteColor,
                                )
                              : Text(
                                  "Masuk",
                                  style: whiteTextStyle,
                                ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
