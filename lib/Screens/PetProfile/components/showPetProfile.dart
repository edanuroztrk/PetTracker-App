import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;
import 'package:petTracker/Screens/PetProfile/components/body.dart';
import 'package:petTracker/Screens/PetProfile/components/loadingSplash.dart';
import 'package:petTracker/Screens/PetProfile/pet_profile.dart';


//TODO renkler düzenlenecegi icin ugrasmadım
class updatePetProfile extends StatefulWidget {
  final String docPath;

  const updatePetProfile({Key key, this.docPath}) : super(key: key);

  @override
  _updatePetProfile createState() => _updatePetProfile();
}

class _updatePetProfile extends State<updatePetProfile>{

  File _imageFile;
  String _imageURL ;
  final picker = ImagePicker();
  final FirebaseAuth auth = FirebaseAuth.instance;





  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = Path.basename(_imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('defaults/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
          (value) =>
              _imageURL = value + "${DateTime.now().millisecondsSinceEpoch}",
        );
  }



  @override
   Widget build(BuildContext context)  {
    final User user = auth.currentUser;
    final uid = user.uid;
    Stream<DocumentSnapshot> dbRef = FirebaseFirestore.instance
        .collection("Person")
        .doc(uid)
        .collection("pets").doc(widget.docPath).snapshots();

    String imageAlt;
    TextEditingController nameTextController;
    TextEditingController ageTextController;
    TextEditingController breedTextController;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream:  dbRef,
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if(snapshot.hasData){
              var snapshotData = snapshot.data;
                   nameTextController= TextEditingController(text: snapshotData['name']);
                   ageTextController= TextEditingController(text: snapshotData['age']);
                   breedTextController= TextEditingController(text: snapshotData["breed"]);
                  imageAlt = snapshotData["image"];// your code here
              print(snapshotData["name"]);}
           return new Stack(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: _imageFile != null
                                    ? Image.file(_imageFile)
                                    : FlatButton(

                                  color: Color(0xFF8fb4f3),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: 50,
                                  ),
                                  onPressed: pickImage,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [uploadImageButton(context)],
                ),
                Container(
                  margin:
                  const EdgeInsets.only(top: 250, left: 20.0, right: 50.0),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: TextField(

                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF8fb4f3)),
                              ),
                              labelText: "Pet Name"),
                          maxLines: 1,
                          controller: nameTextController,
                        ))
                  ]),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(top: 330, left: 20.0, right: 50.0),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF8fb4f3)),
                              ),
                              labelText: "Pet Breed"),
                          maxLines: 1,
                          controller: breedTextController,
                        ))
                  ]),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(top: 410, left: 20.0, right: 50.0),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xFF8fb4f3)),
                              ),
                              labelText: "Pet Age"),
                          maxLines: 1,
                          controller: ageTextController,
                        ))
                  ]),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(top: 490, left: 20.0, right: 50.0),
                  child: Row(
                    children: <Widget>[
                    Flexible(
                        child: RaisedButton(
                            onPressed: () {

                                setState(() {
                                  if(_imageURL == null) {
                                    _imageURL = imageAlt;
                                  }
                                });


                                FirebaseFirestore.instance.collection("Person").doc(uid).collection("pets")
                              .doc(widget.docPath)
                              .update({
                                "name": nameTextController.text,
                                "breed": breedTextController.text,
                                "age": ageTextController.text,
                                "image": _imageURL
                              }).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                        Text('Successfully Updated!')));
                                ageTextController.clear();
                                nameTextController.clear();
                                breedTextController.clear();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return SplashScreen();
                                  }),
                                );

                                });






                            },
                            child: Text("Update",
                                style: TextStyle(
                                  fontFamily: "Patua",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                )),
                            color: Color(0xFF8fb4f3)))
                  ],),
                ),
              ],
            );
          },
            ),
        ),
    );
  }

  Widget uploadImageButton(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.only(top: 170, left: 20.0, right: 20.0),
            decoration: BoxDecoration(
                color: Color(0xFF8fb4f3),
                borderRadius: BorderRadius.circular(10.0)),
            child: FlatButton(
              onPressed: () => uploadImageToFirebase(context),
              child: Text(
                "Update Pet Image",
                style: TextStyle(fontSize: 20, fontFamily: "Patua"),
              ),
            ),
          ),
        ],
      ),
    );
  }

//   @override
//   void dispose() {
//     super.dispose();
//     nameTextController.dispose();
//     ageTextController.dispose();
//     breedTextController.dispose();
//   }
}
