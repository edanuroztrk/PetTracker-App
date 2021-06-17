import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Calendar/calendar_page.dart';
import 'package:petTracker/Screens/FoodTracker/foodtracker_page.dart';
import 'package:petTracker/Screens/PetProfile/pet_profile.dart';
import 'package:petTracker/Screens/Settings/settings_page.dart';
import 'package:petTracker/Screens/News/news_page.dart';
import 'package:petTracker/Screens/Prospectus/prospectus_page.dart';

class GridDashboard extends StatelessWidget {

  Items item1 = new Items(
      title: "Calendar",
      img: "assets/images/calendar3.png",
      page: Calendar(),
  );
  Items item2 = new Items(
    title: "Pet Profile",
    img: "assets/images/profile.png",
    page: PetProfile(),
  );
  Items item3 = new Items(
    title: "Food Tracker",
    img: "assets/images/pet-house.png",
    page: foodtracker_page(),
  );
  Items item4 = new Items(
    title: "Blog",
    img: "assets/images/paws.png",
    page: news_page(),
  );
  Items item5 = new Items(
    title: "Prospectus",
    img: "assets/images/prospectus.png",
    page: prospectus_page(),
  );
  Items item6 = new Items(
    title: "Settings",
    img: "assets/images/settings.png",
    page: settings_page(),
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    var color = 0xFFE35305;
    return Flexible(
      child: GridView.count(

          childAspectRatio: 1.1,
          padding: EdgeInsets.only(left: 31, right: 31),
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: myList.map((data) {
            return RaisedButton(
              color: Color(0xff468aa4), //change this into another color
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> data.page));},

              //   decoration: BoxDecoration(
             //     color: Color(0xFFD57B49), borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 80,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: TextStyle(color:Color(0xFF1F2421) , fontSize: 23, fontWeight: FontWeight.w600, fontFamily: "Patua"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}


class Items {
  String title;
  String img;
  Widget page;
  Items({this.title, this.img, this.page});
}
