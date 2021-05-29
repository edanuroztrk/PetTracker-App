
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/HomePage/components/NavigationBar.dart';



class home_page extends StatelessWidget {
  static const String routeName = '/HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBar(),
    );
  }
}