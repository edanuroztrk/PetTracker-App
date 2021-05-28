import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;
import 'package:petTracker/Screens/PetProfile/components/body.dart';

//TODO renkler düzenlenecegi icin ugrasmadım
class addNewPetPage extends StatefulWidget {
  @override
  _addNewPetPage createState() => _addNewPetPage();
}

class _addNewPetPage extends State<addNewPetPage> {
  final _formKey = GlobalKey<FormState>();
  final ageTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final breedTextController = TextEditingController();
  //dont accept empty spaces.
  bool _validateName = false;
  File _imageFile;
  //TODO db islemi here
  //to add pet to the database- it should be refactored after auth completed.
  final dbRef = FirebaseFirestore.instance
      .collection("users")
      .doc("susudeneme")
      .collection("pets");



  final picker = ImagePicker();

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
          (value) => print("Done: $value"),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Expanded(
                    child: Stack(
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
                                      color: Colors.deepOrangeAccent,
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
                  ),
                ],
              ),
            ),
            Row(
              children: [uploadImageButton(context)],
            ),
            Container(
              margin: const EdgeInsets.only(top: 250, left: 20.0, right: 50.0),
              child: Row(children: <Widget>[
                Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      errorText: _validateName ? 'Value Can\'t Be Empty' : null,
                      labelText: "Pet Name"),
                  maxLines: 1,
                  controller: nameTextController,
                ))
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 330, left: 20.0, right: 50.0),
              child: Row(children: <Widget>[
                Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      labelText: "Pet Breed"),
                  maxLines: 1,
                  controller: breedTextController,
                ))
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 410, left: 20.0, right: 50.0),
              child: Row(children: <Widget>[
                Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                      ),
                      labelText: "Pet Age"),
                  maxLines: 1,
                  controller: ageTextController,
                ))
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(top: 510, left: 20.0, right: 50.0),
              child: Row(children: <Widget>[
                Flexible(
                    child: RaisedButton(
                    onPressed: () {
                      setState(() {
                      nameTextController.text.isEmpty ? _validateName = true : _validateName = false;
                       });
                      if (_formKey.currentState.validate()) {
                        dbRef.doc().set({
                          "name": nameTextController.text,
                          "breed": breedTextController.text,
                          "age": ageTextController.text,
                        }).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('New Pet Profile Added!')));
                          ageTextController.clear();
                          nameTextController.clear();
                          breedTextController.clear();
                        }).catchError((onError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(onError)));
                        });
                      }

                    },
                        child: Text("Save",
                            style: TextStyle(
                              fontFamily: "Patua",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        color: Colors.deepOrange))
              ]),
            )

          ],

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
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10.0)),
            child: FlatButton(
              onPressed: () => uploadImageToFirebase(context),
              child: Text(
                "Add Pet Image",
                style: TextStyle(fontSize: 20, fontFamily: "Patua"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
