import 'package:flutter/material.dart';
import 'package:petTracker/Screens/homePage/homee_page.dart';
import 'package:petTracker/main.dart';
//TODO düzenlenecek
class SideBar extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
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
            color:  Color(0xFFF3C186),
            child: Text(
              '           Menu',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
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