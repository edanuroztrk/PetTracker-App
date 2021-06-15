import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/News/components/newsDetailPage.dart';

class catNews extends StatefulWidget {
  static const String routeName = '/catNews';
  const catNews({Key key}) : super(key: key);

  @override
  _catNewsState createState() => _catNewsState();
}

class _catNewsState extends State<catNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('News')
                      .doc('LcPGpkjwkD3N51olyeDE')
                      .collection('Cats')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      print('test phrase');
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.deepOrange,
                          valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                          strokeWidth: 7,
                        ),
                      );
                    }
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.deepOrange,
                            valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                            strokeWidth: 7,
                          ),
                        );
                      default:
                        return ListView(
                          shrinkWrap: true,
                          //itemBuilder:
                          children: snapshot.data.docs
                              .map((DocumentSnapshot document) {
                            return new Stack(
                              children: [
                                InkWell(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 0, left: 100),
                                    width: MediaQuery.of(context).size.width,
                                    height: 170.0,
                                    child: Column(
                                      children: [

                                        Card(

                                          color: Color(0xFFDDAA84),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8.0,
                                              left: 54.0,
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  //SizedBox(height: 10),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Center(
                                                          child: Text(
                                                              "${document.data()['header']}",
                                                              style: TextStyle(
                                                                fontFamily: "Patua",
                                                                fontWeight:
                                                                FontWeight.w100,
                                                                fontSize: 20,
                                                                color:
                                                                Color(0xFF321505),
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Row(
                                                    children: <Widget>[
                                                      Center(
                                                        child: Text(
                                                            "${document.data()['resource']}",
                                                            style: TextStyle(
                                                              fontFamily: "Patua",
                                                              fontWeight:
                                                              FontWeight.w100,
                                                              fontSize: 20,
                                                              color:
                                                              Color(0xFF453431),
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 20),

                                                ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return newsDetail(petType: "Cats",
                                            docPath: document.id);
                                      }),
                                    );
                                  },
                                ),
                                Positioned(
                                  top: 10.0,
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            document.data()["newImage"],
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        );
                    }
                  },
                ),
              ],
            )
        ),
      )
    );
  }
}
