import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Calendar/components/body.dart';
import 'package:petTracker/Screens/News/components/body.dart';
import 'package:petTracker/Screens/PetProfile/components/body.dart';
import 'package:petTracker/Screens/Settings/components/body.dart';
import 'package:petTracker/Screens/homePage/components/body.dart';

import 'package:petTracker/SideBar.dart';


class NavigationBar extends StatefulWidget {
  final int pageNumber;
  NavigationBar ({Key key, this.pageNumber}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}


class _NavigationBarState extends State<NavigationBar > {



  static const List<Widget> _widgetOptions = <Widget>[
    profileBody(),
    calendarBody(),
    homeBody(),
    newsBody(),
    settingsBody(),
  ];
  int _selectedPage = 0 ;

  void _onItemTapped(int index) {
    setState(() {
      _selectedPage = index;
    });
  }


//nothing to do in here
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
                (_widgetOptions.elementAt(_selectedPage)),


      drawer: SideBar(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications,size: 30,),
            //Todo notification button aktif edilmeli
            onPressed: (){

            },
          ),

        ],),



      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF3C186),
        currentIndex: _selectedPage,
        onTap: _onItemTapped,
        //elevation: 5,
        items:[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),title: Text('Profile'),backgroundColor: Color(0xFFD57B49)),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),title: Text('Calendar'),backgroundColor: Color(0xFFD57B49)),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),title: Text('Home'),backgroundColor: Color(0xFFD57B49)),
          BottomNavigationBarItem(
              icon: Icon(Icons.wysiwyg),title: Text('News'),backgroundColor: Color(0xFFD57B49)),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),title: Text('Settings'),backgroundColor: Color(0xFFD57B49)),
        ],
      ),




    );

  }
}
