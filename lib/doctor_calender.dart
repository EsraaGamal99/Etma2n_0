import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
class DoctorCalender extends StatelessWidget {
  const DoctorCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TableCalendar(
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      ),
    );
  }
}