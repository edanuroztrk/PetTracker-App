import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Welcome/welcome_screen.dart';
import 'package:petTracker/constants.dart';
const mainback = Color(0xf2c186);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pet tracker',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: mainColor,
      ),
      home: WelcomeScreen(),
    );
  }
}
