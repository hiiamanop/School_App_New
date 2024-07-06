import 'package:flutter/material.dart';
import 'package:school_super_app/components/customContainer.dart';
import 'package:school_super_app/themes/theme.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();
  
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        containerColor: whiteColor,
        containerWidth: double.infinity,
        containerHeight: 420,
        containerMargin: 5,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: TableCalendar(
              locale: "en_US",
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(205),
              lastDay: DateTime.utc(2030),
              onDaySelected: _onDaySelected,),
        ));
  }
}
