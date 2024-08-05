import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:school_super_app/pages/Kelas/Input_Kelas.dart';
import 'package:school_super_app/pages/homePage.dart';
import 'package:school_super_app/pages/profilePage.dart';
import 'package:school_super_app/pages/settingPage.dart';
import 'package:school_super_app/themes/theme.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 1;
  List<Widget> widgetList = const [
    InputKelas(),
    HomePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bannerColor ??
            Colors
                .white, // Provide a default color if Colors.grey[100] is nullable
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(Icons.list, color: Colors.grey[500]),
          Icon(Icons.home, color: Colors.grey[500]),
          Icon(Icons.person, color: Colors.grey[500]),
        ],
      ),
      body: Center(
        child: widgetList[_currentIndex],
      ),
    );
  }
}
