import 'package:flutter/material.dart';
import 'package:petTracker/widgets/Body.dart';
import 'package:petTracker/widgets/Header.dart';
import 'package:petTracker/routes/SideBarRouter.dart';

class SideBar extends StatelessWidget {
  int _selectedPage;
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
            icon: Icons.person ,
            text: 'Profile',
            onTap: () =>
                Navigator.pushReplacementNamed(context, pageRoutes.profile),
          ),
          createDrawerBodyItem(
            icon: Icons.calendar_today_outlined,
            text: 'Calendar',
            onTap: () =>
                Navigator.pushNamed(context, pageRoutes.calendar),
          ),

          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () =>
                Navigator.pushNamed(context, pageRoutes.home),
          ),
          createDrawerBodyItem(
            icon:  Icons.wysiwyg,
            text: 'News',
            onTap: () =>
                Navigator.pushNamed(context, pageRoutes.news),
          ),
          createDrawerBodyItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () =>
                Navigator.pushNamed(context, pageRoutes.settings),
          ),



        ],
      ),
    );
  }
}


// class SideBar extends StatefulWidget {
//   const SideBar({Key key}) : super(key: key);
//
//   @override
//   _SideBarState createState() => _SideBarState();
// }
//
// class _SideBarState extends State<SideBar> {
//
//   int _selectedPage;
//
//   static const List<Widget> _widgetOptions = <Widget>[
//     profileBody(),
//     calendarBody(),
//     homeBody(),
//     newsBody(),
//     settingsBody(),
//   ];
//   void tapHandler(int index) {
//     setState(() {
//       _selectedPage = index;
//     });
//   }
//
//
//
//   Widget buildListTile(String title, IconData icon, Function tapHandler,int index) {
//     return ListTile(
//       leading: Icon(
//         icon,
//         color : Color(0xFFDB410C),
//         size: 26,
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           color:  Color(0xD002010E),
//           fontFamily: "Patua",
//           fontSize: 24,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       onTap: tapHandler(index),
//     );
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//
//       child: Column(
//
//         children: <Widget>[
//
//           Container(
//
//             height: 80,
//             width: double.infinity,
//             padding: EdgeInsets.all(20),
//             alignment: Alignment.centerLeft,
//             color:  Color(0xFFE9651F),
//             child: Text(
//               '           Menu',
//               style: TextStyle(
//                   fontFamily: "Patua",
//                   fontWeight: FontWeight.w800,
//                   fontSize: 30,
//                   color: Color(0xD002010E)),
//             ),
//           ),
//           SizedBox(
//
//             height: 10,
//           ),
//           buildListTile('Home', Icons.home, () {
//
//           },0),
//           buildListTile('Profile',  Icons.person, () {
//
//           },1),
//           buildListTile('Calendar', Icons.calendar_today_outlined, () {
//
//           },2),
//           buildListTile('News', Icons.wysiwyg, () {
//
//           },3),
//           buildListTile('Settings', Icons.settings, () {
//
//           },4),
//
//         ],
//       ),
//     );
//   }
// }
//
//
//
