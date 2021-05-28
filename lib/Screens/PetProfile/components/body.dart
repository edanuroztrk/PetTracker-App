import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:petTracker/Screens/PetProfile/components/addNewPetPage.dart';
import 'package:petTracker/Screens/PetProfile/components/showPetProfile.dart';
import 'dart:async';


class profileBody extends StatelessWidget  {
  //final FirebaseFirestore fb = FirebaseFirestore.instance;
  const profileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children:  [
        Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
            child: listOfPets(context),
        ),

        IconButton(
            color: Color(0xFFDD8859),
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
            },),
      ],
    ) ;


  }

  
   Widget listOfPets(BuildContext context) {
   // final int petAmount = await Firestore.instance.collection('users').doc("susudeneme").collection("pets").snapshots().length;

    return FutureBuilder(
      builder: (context,projectSnap) {
        return ListView.builder(
          //item count database deki pet sayısından cekilecek length olarak
          //user-> users pets-> length
          //TODO item count burada hallet.
          shrinkWrap: true,
          itemCount:2,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                Positioned(child: _petUI(context)),
                //TODO dbden cekilen image string buraya gelecek
                Positioned(
                    top: 10.0,
                    child: _petPhoto(
                        'gs://pet-tracker-a62f2.appspot.com/default/profile_cat.png')),

              ],

            );
          },
          //separatorBuilder: (BuildContext context, int index) => const Divider(),
        );
      },);
  }
  
  Widget _petUI(BuildContext context){
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 120 ) ,
         width: MediaQuery.of(context).size.width,
        height: 170.0,
        child: Card(
          color : Color(0xFFD57B49),
          child:  Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children : <Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Name: Mimi",
                      style : TextStyle(
                      fontFamily: "Patua",
                      fontWeight: FontWeight.w100,
                      fontSize: 20,
                      color: Color(0xFF321505),)),
                  ],
                ),
                Row(
                  children: <Widget> [
                    Text("Breed: ",
                        style : TextStyle(
                          fontFamily: "Patua",
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                          color: Color(0xFF321505),)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Age: ",
                        style : TextStyle(
                          fontFamily: "Patua",
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                          color: Color(0xFF321505),)),
                  ],
                ),

              ]
            ),
          ),
        ),

      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return updatePetProfile();
          }),
        );
      },
    );

  }

  Widget _petPhoto(String storageURL){
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: FirebaseImage(storageURL),
          fit: BoxFit.cover
        )
      ),
    );
  }

  
}




// new Card(
//
// child: new ListTile(
//
//
// leading: new Image(
// image: FirebaseImage('gs://pet-tracker-a62f2.appspot.com/default/profile_cat.png'),
// // Works with standard parameters, e.g.
// fit: BoxFit.cover,
//
//
// ),
//
// title: new Text(
// "cat",
// style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
// ),
// subtitle: new Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// new Text("cat",
// style: new TextStyle(
// fontSize:30, fontWeight: FontWeight.normal)),
// new Text("cat",
// style: new TextStyle(
// fontSize: 30, fontWeight: FontWeight.normal)),
// ]),
// //trailing: ,
// // onTap: () {
// //   _showSnackBar(context, _allCities[index]);
// },
// // class petPicture extends StatelessWidget {
//   final String pic;
//   const petPicture({Key key,this.pic}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(4.0),
//         child: Container(
//           width: MediaQuery.of(context).size.width / 1.20  ,
//           height:  200,
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage(pic),
//                 fit: BoxFit.cover),
//           ),
//         ) ,
//
//       ),
//     );
//   }
// }


//
// class PetProfileHeader extends StatelessWidget {
//   final String petInfo;
//   const PetProfileHeader({Key key, this.petInfo}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       //crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text("Mimi's Profile",
//               style: new TextStyle(
//                   fontSize: 27.0,
//                   color: Color(0xFFF56014),
//                   fontWeight: FontWeight.w500
//                   ,fontFamily: "Patua")),
//         ),
//
//         Text(
//           'Bleed: Scottish',
//           style: TextStyle(
//               color: Color(0xFFBA6439),
//               fontSize: 18.0,
//               fontWeight: FontWeight.w500
//               ,fontFamily: "Patua"),
//         ),
//         Text(
//           'Age:23 months',
//           style: TextStyle(
//               color: Color(0xFFBA6439),
//               fontSize: 18.0,
//               fontWeight: FontWeight.w500
//               ,fontFamily: "Patua"),
//         ),
//         Text(
//           'Weight:2 kgs',
//           style: TextStyle(
//               color: Color(0xFFBA6439),
//               fontSize: 18.0,
//               fontWeight: FontWeight.w500
//               ,fontFamily: "Patua"),
//         ),
//
//
//         Icon(
//           Icons.edit,
//           color: Color(0xE2E7AC0F),
//           size: 30.0,
//         ),
//
//
//
//
//
//
//       ],
//
//     );
//   }
// }
//
//
//
//
//
//
//



