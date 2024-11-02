import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:school_super_app/pages/Enrollment/Enrollment_views.dart';
import 'package:school_super_app/pages/homePage.dart';
import 'package:school_super_app/pages/settingPage.dart';
import 'package:school_super_app/themes/theme.dart';

class Navbar extends StatefulWidget {
  final String userId; // Tambahkan userId sebagai parameter

  const Navbar({required this.userId, super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 1;

  // Tidak dideklarasikan di luar metode build karena userId berasal dari widget
  late List<Widget> widgetList;

  @override
  void initState() {
    super.initState();
    // Inisialisasi widgetList di initState atau di dalam build
    widgetList = [
      EnrollmentView(userId: widget.userId),
      HomePage(userId: widget.userId),
      SettingPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bgColor.withOpacity(0.7),
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          Icon(Icons.list, color: Colors.grey[500]),
          Icon(Icons.home, color: Colors.grey[500]),
          Icon(Icons.settings, color: Colors.grey[500]),
        ],
      ),
      body: Center(
        child: widgetList[_currentIndex],
      ),
    );
  }
}
