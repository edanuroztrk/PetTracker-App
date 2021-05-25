import 'package:flutter/material.dart';
import 'package:petTracker/Screens/homePage/home_page.dart';
import 'package:petTracker/main.dart';
//TODO düzenlenecek
class SideBar extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        color : Color(0xFFD57B49),
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          color:  Color(0xD002010E),
          fontFamily: "Patua",
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(

        children: <Widget>[

          Container(

            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color:  Color(0xFFD57B49),
            child: Text(
              '           Menu',
              style: TextStyle(
                fontFamily: "Patua",
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                  color: Color(0xFF321505)),
            ),
          ),
          SizedBox(

            height: 10,
          ),
          buildListTile('Home', Icons.home, () {

          }),
          buildListTile('Profile',  Icons.person, () {

          }),
          buildListTile('Calendar', Icons.calendar_today_outlined, () {

          }),
          buildListTile('News', Icons.wysiwyg, () {

          }),
          buildListTile('Settings', Icons.settings, () {

          }),

        ],
      ),
    );
  }}