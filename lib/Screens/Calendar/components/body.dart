import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/components/rounded_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


CalendarController _controller=CalendarController();
class calendarBody extends StatelessWidget {
  const calendarBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicEvent()/* TableCalendar(

          calendarController: _controller)*/,
    );
  }

}
class DynamicEvent extends StatefulWidget {
  @override
  _DynamicEventState createState() => _DynamicEventState();
}

class _DynamicEventState extends State<DynamicEvent> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }
  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Colors.red,
                  selectedColor: Theme.of(context).primaryColor,
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Color(0xff0091c8),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events,holidays) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              calendarController: _controller,
            ),
            ..._selectedEvents.map((event) => Padding(
              padding: const EdgeInsets.all(8.0),
    child: Center( child: Container(
               height: MediaQuery.of(context).size.height/14,
                width: (MediaQuery.of(context).size.width+50)/1.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff285082),
                    border: Border.all(color: Color(0xff1c6582))
                ),
                child: Center(
                    child: Text(event,
                      style: TextStyle(color: Colors.white,
                          fontSize: 16),)
                ),
              ),),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add'),
        backgroundColor: Color(0xff1c6596),
      icon: Icon(Icons.add),

        onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color(0xffe0ecff),
          title: Text("Add Events",style: TextStyle(color: Color(0xff002e3e)),),
          content: TextField(
            controller: _eventController,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Save",style: TextStyle(color: Color(0xffffffff),fontSize: 22,fontWeight: FontWeight.w200),),
              color: Color(0xff285082),
              onPressed: () {
                if (_eventController.text.isEmpty) return;
                setState(() {
                  if (_events[_controller.selectedDay] != null) {
                    _events[_controller.selectedDay]
                        .add(_eventController.text);
                  } else {
                    _events[_controller.selectedDay] = [
                      _eventController.text
                    ];
                  }
                  prefs.setString("events", json.encode(encodeMap(_events)));
                  _eventController.clear();
                  Navigator.pop(context);
                });

              },
            )
          ],
        ));
  }
}