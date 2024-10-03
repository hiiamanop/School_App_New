import 'package:flutter/material.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/themes/theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: whiteColor,
        child: Padding(
            padding: EdgeInsets.fromLTRB(25, 50, 25, 25),
            child: CustomContainer(
                containerColor: whiteColor,
                containerWidth: double.infinity,
                containerHeight: double.infinity,
                containerMargin: 5,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [Text('Settings', style: blackTextStyle.copyWith(fontSize: 25),)],
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.search, color: greyColor, size: 12),
                            hintText: "Cari sesuatu disini...?",
                            hintStyle: greyTextStyle.copyWith(
                                fontWeight: FontWeight.w800),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 4.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: [
                            Icon(Icons.lock_reset,
                                color: bannerColor),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Ubah password',
                              style: blackTextStyle.copyWith(fontSize: 17),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.drive_file_rename_outline_outlined,
                                color: bannerColor),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'About',
                              style: blackTextStyle.copyWith(fontSize: 17),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.logout, color: bannerColor),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Logout',
                              style: blackTextStyle.copyWith(fontSize: 17),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    )))),
      ),
    );
  }
}
