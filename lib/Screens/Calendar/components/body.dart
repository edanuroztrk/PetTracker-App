import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/components/rounded_button.dart';
import 'package:table_calendar/table_calendar.dart';

CalendarController _controller=CalendarController();
class calendarBody extends StatelessWidget {
  const calendarBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TableCalendar(

          calendarController: _controller),
    );
  }





}
