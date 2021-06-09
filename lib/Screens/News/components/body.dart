
import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/routes/SideBarRouter.dart';

class newsBody extends StatefulWidget {
  const newsBody({Key key}) : super(key: key);





  @override
  _newsBody createState() => _newsBody();
}

class _newsBody extends State<newsBody> {

  String _choosePage(int index) {
    String choosedPage ;
    setState(() {
      if(index == 0){
        choosedPage = pageRoutes.catPage;
      }
      else
        choosedPage = pageRoutes.dogPage;
    });
    return choosedPage;

  }
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['Cat News','Dog News'];
    final List<String> imageURLs = <String>["gs://pet-tracker-a62f2.appspot.com/news-images/6977465fb09d6a8cc874d9ee6fbb3145.jpg"
      ,"gs://pet-tracker-a62f2.appspot.com/news-images/1e3b832d29b1411922fa7bda42ea03fe.jpg"];






    return Container(
        child: ListView.builder(

          padding: const EdgeInsets.all(8),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return new InkWell(
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color(0xDFFF6000),
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: FirebaseImage('${imageURLs[index]}'),
                            fit: BoxFit.cover),


                      ),
                      //tileColor: Colors.white70,

                      child: Padding(
                        padding: EdgeInsets.only(left: 15,top : 120),
                        child: Text('${entries[index]}',
                        style: TextStyle(fontFamily: "Patua",
                        fontSize: 40,
                        color: Color(0xFF150C02)),),
                      ),

                    ),

                  ),

                ),

              ),
              onTap:   () =>
                  Navigator.pushNamed(context, _choosePage(index)),

            );
          },
        ),
    );


  }
}
