import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Color(0xFFD57B49),
      ),


      child: Stack(children: <Widget>[
          Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text("Menu",
              style: TextStyle(
                  fontFamily: "Patua",
                  fontWeight: FontWeight.w800,
                  fontSize: 40,
                  color: Color(0xFF321505))),),
          ]));
}