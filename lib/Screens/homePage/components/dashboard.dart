import 'package:flutter/material.dart';


class GridDashboard extends StatelessWidget {

  Items item1 = new Items(
      title: "Calendar",
      img: "assets/images/calendar3.png");

  Items item2 = new Items(
    title: "Pet Profile",
    img: "assets/images/profile.png",
  );
  Items item3 = new Items(
    title: "Pet Tracker",
    img: "assets/images/pet-house.png",
  );
  Items item4 = new Items(
    title: "Blog",
    img: "assets/images/paws.png",
  );
  Items item5 = new Items(
    title: "Prospectus",
    img: "assets/images/prospectus.png",
  );
  Items item6 = new Items(
    title: "Settings",
    img: "assets/images/settings.png",
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
            return Container(
              decoration: BoxDecoration(
                  color: Color(0xFFD57B49), borderRadius: BorderRadius.circular(5)),
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
                    style: TextStyle(color:Color(0xFF321505) , fontSize: 25, fontWeight: FontWeight.w600, fontFamily: "Patua"),
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
  Items({this.title, this.img});
}
