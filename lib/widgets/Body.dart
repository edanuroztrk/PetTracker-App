import 'package:flutter/material.dart';

Widget createDrawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon,color: Color(0xFFD57B49), size: 30,),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text,
            style: TextStyle(
              color:  Color(0xFF321505),
              fontFamily: "Patua",
              fontSize: 24,
              fontWeight: FontWeight.w500,

            ),),
        )
      ],
    ),
    onTap: onTap,
  );
}