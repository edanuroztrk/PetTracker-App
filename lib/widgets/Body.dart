import 'package:flutter/material.dart';

Widget createDrawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon,color: Color(0xFF1F2421), size: 30,),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text,
            style: TextStyle(
              color:  Color(0xff1d6682),
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