import 'package:flutter/material.dart';
import 'package:petTracker/Screens/News/components/NavigationBar.dart';

class news_page extends StatelessWidget {
  static const String routeName = '/News';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBar(),
    );
  }
}