import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Calendar/calendar_page.dart';
import 'package:petTracker/Screens/HomePage/home_page.dart';
import 'package:petTracker/Screens/News/news_page.dart';
import 'package:petTracker/Screens/PetProfile/pet_profile.dart';
import 'package:petTracker/Screens/Settings/settings_page.dart';
import 'package:petTracker/Screens/Welcome/welcome_screen.dart';
import 'package:petTracker/constants.dart';
import 'package:petTracker/routes/SideBarRouter.dart';
import 'package:firebase_core/firebase_core.dart';
const mainback = Color(0xf2c186);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

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
        canvasColor: Color(0xFFF3C186),
        fontFamily: "Patua"
      ),

      home: WelcomeScreen(),
      routes:  {
        pageRoutes.profile: (context) => PetProfile(),
        pageRoutes.calendar: (context) => Calendar(),
        pageRoutes.home: (context) => home_page(),
        pageRoutes.settings: (context) => settings_page(),
        pageRoutes.news: (context) => news_page(),
      },
    );
  }
}
