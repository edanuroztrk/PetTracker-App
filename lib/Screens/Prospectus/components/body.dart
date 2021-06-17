
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Prospectus/components/medicineDetailPage.dart';

class prospectusBody extends StatefulWidget {
  const prospectusBody({Key key}) : super(key: key);

  @override
  _prospectusBodyState createState() => _prospectusBodyState();
}

class _prospectusBodyState extends State<prospectusBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                      .collection('Medicines')
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
                                  height: 100,
                                  child: Column(
                                    children: [

                                      Card(
                                        color: Color(0xFF8fb4f3),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8,
                                            bottom: 8.0,
                                          ),
                                          child: ListTile(
                                            title:
                                              Row(
                                                children: [

                                                     Text(
                                                      "${document.data()['name']}",
                                                    style: TextStyle(
                                                       fontFamily: "Patua",
                                                       fontWeight:
                                                       FontWeight.w100,
                                                       fontSize: 20,
                                                       color: Color(0xFF1F2421),
                                                        )),

                                                 Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Text(
                                                          "${document.data()['type']}",
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                            fontFamily: "Patua",
                                                            fontWeight:
                                                            FontWeight.w100,
                                                            fontSize: 20,
                                                            color: Color(
                                                                0xFFFFFFFF),
                                                          )),
                                                 ),



                                                ],
                                              ),

                                            subtitle:
                                                 Text(
                                                    "${document.data()['body']}",
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontFamily: "Patua",
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w100,
                                                    )),
                                            trailing: Icon(Icons.medical_services_outlined),
                                            isThreeLine: true,



                                           ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return medicineDetail(docPath: document.id);
                                    }),
                                  );
                                },
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
    );
  }
}
