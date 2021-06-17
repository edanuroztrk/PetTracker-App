import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/PetProfile/pet_profile.dart';




class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => PetProfile())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xff1d6682),
          valueColor: AlwaysStoppedAnimation(Colors.white70),
        ),
      ),
    );
  }
}