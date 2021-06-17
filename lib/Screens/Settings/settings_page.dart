
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Settings/components/NavigationBar.dart';
import 'package:petTracker/Screens/Settings/components/body.dart';


class settings_page extends StatelessWidget {
  static const String routeName = '/Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBar(),
    );
  }
}