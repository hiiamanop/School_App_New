import 'package:flutter/material.dart';
import 'package:school_super_app/components/calendar.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/themes/theme.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          title: Text('Kalender', style: blackTextStyle,),
        ),
        body: Padding(padding: EdgeInsets.all(10), child: Calendar()));
  }
}
