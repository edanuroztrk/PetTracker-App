import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Prospectus/components/NavigationBar.dart';
import 'package:petTracker/Screens/Prospectus/components/body.dart';


class prospectus_page extends StatelessWidget {
  static const String routeName = '/Prospectus';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: prospectusBody(),
    );
  }
}