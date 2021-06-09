import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class newsDetail extends StatefulWidget {
  final String petType;
  final String docPath;
  const newsDetail({Key key, this.docPath, this.petType}) : super(key: key);

  @override
  _newsDetailState createState() => _newsDetailState();
}

class _newsDetailState extends State<newsDetail> {

  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> dbRef = FirebaseFirestore.instance
        .collection("News")
        .doc('LcPGpkjwkD3N51olyeDE')
        .collection(widget.petType).doc(widget.docPath).snapshots();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream:  dbRef,
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
               print('test phrase');
            return CircularProgressIndicator(
                      backgroundColor: Colors.deepOrange,
                valueColor: AlwaysStoppedAnimation(Colors.deepOrangeAccent),
                    strokeWidth: 7,
                  );
                      }
            var snapshotData = snapshot.data;


            return new Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                       Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,

                            image: DecorationImage(
                              image: NetworkImage(
                                snapshotData.data()['newImage'],
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(top: 260, left: 20.0, right: 50.0),
                  child: Center(
                    child: Row(children: <Widget>[
                      Flexible(
                          child: Text("${snapshotData['header']}",
                                style: TextStyle(
                                fontFamily: "Patua",
                                fontWeight:FontWeight.w100,
                                fontSize: 20,
                                color:Color(0xFF110404),)
                          )),
                    ]),
                  ),
                ),


                Container(
                  margin:
                  const EdgeInsets.only(top:340, left: 20.0, right: 50.0),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: Text("${snapshotData['body']}",
                            style: TextStyle(
                              fontFamily: "Patua",
                              fontSize: 14,
                              color:Color(0xFF0A0101),)

                     )),

                  ]),
                ),
                Text("Resource : " + "${snapshotData['resource']}",
                    style: TextStyle(
                      fontFamily: "Patua",
                      fontWeight:FontWeight.w100,
                      fontSize: 20,
                      color:Color(0xA11C0E0E),)),


              ],
            );
            },

        ),
      ),
    );
  }
}

