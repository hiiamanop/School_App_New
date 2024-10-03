import 'package:flutter/material.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/themes/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Profile", style: blackTextStyle)),
        body: Container(
            color: whiteColor,
            child: Padding(
                padding: EdgeInsets.fromLTRB(25, 50, 25, 25),
                child: CustomContainer(
                    containerColor: whiteColor,
                    containerWidth: double.infinity,
                    containerHeight: double.infinity,
                    containerMargin: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(height: 25,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("ini untuk photoprofile")],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("ini untuk username")],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("ini untuk email")],
                          ),
                          SizedBox(height: 15,),

                        ],
                      ),
                    )))));
  }
}
