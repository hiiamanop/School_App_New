import 'package:flutter/material.dart';
import 'package:school_super_app/components/customButton.dart';
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
      body: Center(
        // list<Builder>
      ),
    );
  }
}
