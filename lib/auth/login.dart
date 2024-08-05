import 'package:flutter/material.dart';
import 'package:school_super_app/themes/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
                      Text("NIS",
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: borderColor)),
                        hintText: "Masukan NIS",
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
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: null, icon: Icon(Icons.visibility)),
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
                    height: 10,
                  ),
                  
                  Container(
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: bgColor,
                        ),
                        onPressed: () {
                          // authC.login();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Masuk',
                              style: whiteTextStyle,
                            ),
                          ],
                        )),
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
