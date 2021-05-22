

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/homePage/components/sidebar.dart';
import 'package:petTracker/main.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: AppBar(
          actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: (){

            },
          ),

      ],),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF3C186),
         currentIndex: 2,
        items:[
          BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('Profile'),backgroundColor: Color(0xFFD57B49)),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today_outlined),title: Text('Calendar'),backgroundColor: Color(0xFFD57B49)),
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('Home'),backgroundColor: Color(0xFFD57B49)),
          BottomNavigationBarItem(icon: Icon(Icons.wysiwyg),title: Text('News'),backgroundColor: Color(0xFFD57B49)),
          BottomNavigationBarItem(icon: Icon(Icons.settings),title: Text('Settings'),backgroundColor: Color(0xFFD57B49)),
        ],
      ),
    );


  }
}
