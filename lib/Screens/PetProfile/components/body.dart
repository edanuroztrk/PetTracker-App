import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petTracker/Screens/PetProfile/components/addNewPetPage.dart';
import 'package:petTracker/Screens/PetProfile/components/showPetProfile.dart';
import 'package:petTracker/components/auth.dart';
//TODO db güncellemesi gelene kadar DONE
//DONEEEEEEEEEEEEEEEEEE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

class profileBody extends StatelessWidget {

  const profileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: listOfPets(context),
          ),
          IconButton(
            color:  Color(0xff1d6682),
            alignment: Alignment.bottomCenter,
            iconSize: 50,
            icon: Icon(Icons.add_box),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return addNewPetPage();
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget listOfPets(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.uid;
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance
                  .collection('Person')
                  .doc(uid)
                  .collection("pets")
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  print('test phrase');
                  return CircularProgressIndicator(
                    backgroundColor: Color(0xFF8fb4f3),
                    valueColor: AlwaysStoppedAnimation(Color(0xFF8fb4f3)),
                    strokeWidth: 7,
                  );
                }
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator(
                      backgroundColor: Color(0xFF8fb4f3),
                      valueColor: AlwaysStoppedAnimation(Color(0xFF8fb4f3)),
                      strokeWidth: 7,
                    );
                  default:
                    return ListView(
                      shrinkWrap: true,
                      //itemBuilder:
                      children: snapshot.data.documents
                          .map((DocumentSnapshot document) {
                        return new Stack(
                          children: [
                            InkWell(
                              child: Container(
                                margin: EdgeInsets.only(top: 15, left: 120),
                                width: MediaQuery.of(context).size.width,
                                height: 170.0,
                                child: Column(
                                  children: [

                                    Card(
                                      color: Color(0xFF8fb4f3),
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
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                      "Name: " +
                                                          document['name'],
                                                      style: TextStyle(
                                                        fontFamily: "Patua",
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 20,
                                                        color:
                                                        Color(0xFF1F2421),
                                                      )),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                      "Breed: " +
                                                          document['breed'],
                                                      style: TextStyle(
                                                        fontFamily: "Patua",
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 20,
                                                        color:
                                                        Color(0xFF1F2421),
                                                      )),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                      "Age: " +
                                                          document['age']
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontFamily: "Patua",
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 20,
                                                        color:
                                                        Color(0xFF1F2421),
                                                      )),
                                                ],
                                              ),
                                              SizedBox(height: 10),
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
                                    return updatePetProfile(
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
                                        document['image'],
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
        ));
  }
}
