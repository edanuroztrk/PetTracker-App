import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Calendar/components/NavigationBar.dart';


class Calendar extends StatelessWidget {
  static const String routeName = '/Calendar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBar(),
    );
  }
}
