import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Calendar/calendar_page.dart';
import 'package:petTracker/Screens/HomePage/home_page.dart';
import 'package:petTracker/Screens/News/components/catNews.dart';
import 'package:petTracker/Screens/News/components/dogNews.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pet tracker',color: Color(0xff1d6682),
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: mainColor,
        canvasColor: Color(0xFFEBFFFB),
        fontFamily: "Patua"
      ),

      home: WelcomeScreen(),
      routes:  {
        pageRoutes.catPage: (context) => catNews(),
        pageRoutes.dogPage: (context) => dogNews(),
        pageRoutes.profile: (context) => PetProfile(),
        pageRoutes.calendar: (context) => Calendar(),
        pageRoutes.home: (context) => home_page(),
        pageRoutes.settings: (context) => settings_page(),
        pageRoutes.news: (context) => news_page(),
      },
    );
  }
}





