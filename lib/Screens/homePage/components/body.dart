
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/homePage/components/dashboard.dart';


class homeBody extends StatelessWidget {
  const homeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: <Widget>[
        SizedBox(
          height:16 ,
        ),

          Padding(
            padding: EdgeInsets.only(left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              ],
            ),
          ),

        SizedBox(
          height: 10,
        ),
        GridDashboard()
      ],
    );
  }
}
