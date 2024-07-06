import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:school_super_app/themes/theme.dart';

class DateRow extends StatefulWidget {
  @override
  _DateRowState createState() => _DateRowState();
}

class _DateRowState extends State<DateRow> {
  DateTime _currentDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Update the current date every second
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateDate());
  }

  void _updateDate() {
    setState(() {
      _currentDate = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    final String formattedDate = formatter.format(_currentDate);
    final bool isWeekend = _currentDate.weekday == DateTime.saturday || _currentDate.weekday == DateTime.sunday;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isWeekend ? '🏠' : '🏫'),
        SizedBox(width: 10),
        LiveDate(dateTime: _currentDate),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class LiveDate extends StatelessWidget {
  final DateTime dateTime;

  const LiveDate({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd/MM/yy');
    final String formattedDate = formatter.format(dateTime);

    return Text(
      formattedDate,
      style: secondaryTextStyle.copyWith(fontWeight: FontWeight.w800));
  }
}