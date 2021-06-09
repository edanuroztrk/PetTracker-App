
import 'package:petTracker/Screens/Calendar/calendar_page.dart';
import 'package:petTracker/Screens/News/components/body.dart';
import 'package:petTracker/Screens/PetProfile/pet_profile.dart';
import 'package:petTracker/Screens/HomePage/home_page.dart';
import 'package:petTracker/Screens/Settings/settings_page.dart';
import 'package:petTracker/Screens/News/news_page.dart';
import 'package:petTracker/Screens/News/components/catNews.dart';
import 'package:petTracker/Screens/News/components/dogNews.dart';

class pageRoutes {
  static const String catPage = catNews.routeName;
  static const String dogPage= dogNews.routeName;
  static const String profile = PetProfile.routeName;
  static const String calendar = Calendar.routeName;
  static const String home = home_page.routeName;
  static const String settings = settings_page.routeName;
  static const String news = news_page.routeName;
}