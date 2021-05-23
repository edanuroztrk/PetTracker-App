import 'package:flutter/material.dart';
import 'package:petTracker/Screens/PetProfile/components/NavigationBar.dart';

class PetProfile extends StatelessWidget {
  static const String routeName = '/PetProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NavigationBar(),
    );
  }
}
