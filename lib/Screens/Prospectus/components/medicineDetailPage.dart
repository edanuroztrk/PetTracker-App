import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class medicineDetail extends StatefulWidget {
  final String docPath;
  const medicineDetail({Key key, this.docPath}) : super(key: key);

  @override
  _medicineDetailState createState() => _medicineDetailState();
}

class _medicineDetailState extends State<medicineDetail> {
  @override
  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> dbRef = FirebaseFirestore.instance
        .collection("Medicines").doc(widget.docPath).snapshots();
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
                  margin:
                  const EdgeInsets.only(top: 30, left: 20.0, right: 50.0),
                  child: Center(
                    child: Row(children: <Widget>[
                      Flexible(
                          child: Text("${snapshotData['name']} - use ${snapshotData['type']} ! ",
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontFamily: "Patua",
                                fontWeight:FontWeight.w100,
                                fontSize: 22,
                                color:Color(0xFF350505),)
                          )),
                    ]),
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(top: 60, left: 20.0, right: 50.0),
                  child: Center(
                    child: Row(children: <Widget>[
                      Flexible(
                          child: Text("Dosage: ${snapshotData['dosage']}",
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontFamily: "Patua",
                                fontWeight:FontWeight.w100,
                                fontSize: 18,
                                backgroundColor: Colors.limeAccent,
                                color:Color(0xFF4A0A0A),)
                          )),
                    ]),
                  ),
                ),


                Container(
                  margin:
                  const EdgeInsets.only(top:90, left: 20.0, right: 50.0),
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
                Text("Resource : " + "${snapshotData['resource']}  ",
                    style: TextStyle(
                      fontFamily: "Patua",
                      fontWeight:FontWeight.w100,
                      fontSize: 16,
                      color:Color(0xA11C0E0E),)),


              ],
            );
          },

        ),
      ),
    );
  }
}
