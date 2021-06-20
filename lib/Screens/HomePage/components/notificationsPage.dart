import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class notificationsPage extends StatefulWidget {

  const notificationsPage({Key key}) : super(key: key);

  @override
  _notificationsPageState createState() => _notificationsPageState();
}

class _notificationsPageState extends State<notificationsPage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance
                      .collection('Notifications')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      print('test phrase');
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xff1d6682),
                          valueColor: AlwaysStoppedAnimation(Color(0xff1d6682)),
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
                            backgroundColor: Color(0xff1d6682),
                            valueColor: AlwaysStoppedAnimation(Color(0xff1d6682)),
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
                                    width: MediaQuery.of(context).size.width,
                                    height: 80,
                                    child: Column(
                                      children: [
                                        Card(
                                          color: Color(0xffa5c8fd),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8.0,
                                            ),
                                            child: ListTile(
                                              title: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                        "${document.data()['body']}",
                                                        textAlign: TextAlign.left,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(
                                                          fontFamily: "Patua",
                                                          fontWeight:
                                                          FontWeight.w100,
                                                          fontSize: 16,
                                                          color: Color(
                                                              0xFF1F2421),
                                                        )),
                                                  ),


                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
      ),
    );

  }
}