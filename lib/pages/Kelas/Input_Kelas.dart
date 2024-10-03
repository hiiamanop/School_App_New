import 'package:flutter/material.dart';
import 'package:school_super_app/components/customButton.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/themes/theme.dart';

class InputKelas extends StatelessWidget {
  const InputKelas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        title: Text(
          'Kelas',
          style: blackTextStyle,
        ),
      ),
      body: Container(
        color: whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  buttonColor: whiteColor,
                  buttonWidth: double.infinity,
                  buttonMargin: 0,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('Matematika 📏', style: blackTextStyle),
                        SizedBox(height: 5),
                        Text('Ibu Nensi S.Pd', style: blackTextStyle),
                      ],
                    ),
                  ),
                  onTap: () {}),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tambah Kelas', style: blackTextStyle),
                  SizedBox(width: 10),
                  Container(
                    height: 25,
                    width: 30,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.zero, // Remove default padding
                      ),
                      child: Text('+'), // Removed Center widget
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
