
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Calendar/components/body.dart';
import 'package:petTracker/Screens/HomePage/components/notificationsPage.dart';
import 'package:petTracker/Screens/News/components/body.dart';
import 'package:petTracker/Screens/PetProfile/components/body.dart';
import 'package:petTracker/Screens/Settings/components/body.dart';
import 'package:petTracker/Screens/homePage/components/body.dart';
import 'package:petTracker/SideBar.dart';


class NavigationBar extends StatefulWidget {
  final int pageNumber;
  NavigationBar ({Key key, this.pageNumber}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}


class _NavigationBarState extends State<NavigationBar > {


  static const List<Widget> _widgetOptions = <Widget>[
    profileBody(),
    calendarBody(),
    homeBody(),
    newsBody(),
    settingsBody(),
  ];
  int _selectedPage = 2 ;

  void _onItemTapped(int index) {
     setState(() {
      _selectedPage = index;

    });
  }
  // Icon(Icons.notifications,size: 30,),
  //
  // onPressed: (){
  // Navigator.push(
  // context,
  // MaterialPageRoute(builder: (context) => notificationsPage()),
  // );
  //
  //
  // },

//nothing to do in here
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      drawer: SideBar(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: new Stack(
              children: <Widget>[
                new Icon(Icons.notifications),
                new Positioned(
                  right: 0,
                  child: new Container(
                    padding: EdgeInsets.all(1),
                    decoration: new BoxDecoration(
                      color: Color(0xFF4A9AFF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: new Text(
                      '!',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            onPressed: (){
            Navigator.push(
                context,
               MaterialPageRoute(builder: (context) => notificationsPage()),
              );
            },
          ),

        ],),



      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff1d6682),
        currentIndex: _selectedPage,
        onTap: _onItemTapped,
        //elevation: 5,
        items:[
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color:Color(0xFF8fb4f3) ,),title: Text('Profile',style:TextStyle(color: Colors.white ))),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined,color: Color(0xFF8fb4f3)),title: Text('Calendar',style:TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color:Color(0xFF8fb4f3)),title: Text('Home',style:TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(Icons.wysiwyg,color:Color(0xFF8fb4f3)),title: Text('News',style:TextStyle(color: Colors.white))),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,color:Color(0xFF8fb4f3)),title: Text('Settings',style:TextStyle(color: Colors.white))),
        ],
      ),

      body:
          (_widgetOptions.elementAt(_selectedPage)) ,


    );

  }
}
