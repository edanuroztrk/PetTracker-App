import 'package:flutter/material.dart';
import 'package:petTracker/main.dart';
//TODO düzenlenecek
class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(


      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFD57B49),
            ),
            child: Text('Menu'),
          ),

          Container(

             color: Color(0xFFD57B49),
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile',),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text('Calendar'),
            onTap: () {
              //TODO
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              //TODO
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.wysiwyg),
            title: Text('News/Blog'),
            onTap: () {
              //TODO
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              //TODO
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),


    ],
      ),

    );
  }
}