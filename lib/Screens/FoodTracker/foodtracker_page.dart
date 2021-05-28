import 'package:flutter/material.dart';
import 'package:petTracker/Screens/FoodTracker/components/body.dart';


class foodtracker_page extends StatelessWidget {
  static const String routeName = '/FoodTracker';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FoodTracker"),
      ),
      body: foodtrackerBody(),
    );
  }
}