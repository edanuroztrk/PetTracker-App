import 'package:flutter/material.dart';
import 'package:petTracker/widgets/Body.dart';
import 'package:petTracker/widgets/Header.dart';
import 'package:petTracker/routes/SideBarRouter.dart';

class SideBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.person ,
            text: 'Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.profile),
          ),
          createDrawerBodyItem(
            icon: Icons.calendar_today_outlined,
            text: 'Calendar',
            onTap: () =>
                Navigator.pushNamed(context, pageRoutes.calendar),
          ),

          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushNamed(context, pageRoutes.home),
          ),
          createDrawerBodyItem(
            icon:  Icons.wysiwyg,
            text: 'News',
            onTap: () =>
                Navigator.pushNamed(context, pageRoutes.news),
          ),
          createDrawerBodyItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () =>
                Navigator.pushNamed(context, pageRoutes.settings),
          ),



        ],
      ),
    );
  }
}

