import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;

//DONE with logic !!!!!!!!!!!!!!!!!!!!!!!!!


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
  String _imageURL;
  //Item for choosing pet
  Item selectedType;
  //TODO db islemi here
  //to add pet to the database- it should be refactored after auth completed.
  final dbRef = FirebaseFirestore.instance
      .collection("users")
      .doc("susudeneme")
      .collection("pets");

  List<Item> petTypes = <Item>[
    const Item('Cat',Icon(Icons.pets,color:  const Color(0xEB7C311B),),),
    const Item('Dog',Icon(Icons.pets,color:  const Color(0xEB7C311B),)),

  ];

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
          (value) => _imageURL = value,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
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
                  ],
                ),
              ),
              Row(
                children: [uploadImageButton(context)],
              ),
              Padding(
                padding: EdgeInsets.only(top: 210, left: 20.0, right: 50.0),
                child:DropdownButton<Item>(

                  hint:  Text("Select pet type:"),
                  value: selectedType,
                  onChanged: (Item Value) {
                    setState(() {
                      selectedType = Value;
                    });
                  },
                  items: petTypes.map((Item user) {
                    return  DropdownMenuItem<Item>(
                      value: user,
                      child: Row(
                        children: <Widget>[
                          user.icon,
                          SizedBox(width: 10,),
                          Text(
                            user.name,
                            style:  TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 260, left: 20.0, right: 50.0),
                child: Row(children: <Widget>[
                  Flexible(
                      child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        ),
                        errorText: _validateName ? 'Please enter your pets name' : null,
                        labelText: "Pet Name"),
                    maxLines: 1,
                    controller: nameTextController,
                  ))
                ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 340, left: 20.0, right: 50.0),
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
                margin: const EdgeInsets.only(top: 420, left: 20.0, right: 50.0),
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
                margin: const EdgeInsets.only(top: 520, left: 20.0, right: 50.0),
                child: Row(children: <Widget>[
                  Flexible(
                      child: RaisedButton(
                      onPressed: () {
                        setState(() {
                        nameTextController.text.isEmpty ? _validateName = true : _validateName = false;
                         });

                        if (_formKey.currentState.validate() & _validateName == false) {
                          dbRef.doc().set({
                            "type" : selectedType.name,
                            "name": nameTextController.text,
                            "breed": breedTextController.text,
                            "age": ageTextController.text,
                            "image" : _imageURL
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
              ),


            ],

          ),
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
            margin: const EdgeInsets.only(top: 150, left: 20.0, right: 20.0),
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


class Item {
  const Item(this.name,this.icon);
  final String name;
  final Icon icon;
}