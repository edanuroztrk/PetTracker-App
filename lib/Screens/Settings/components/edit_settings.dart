import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Settings/components/body.dart';
import 'package:petTracker/Screens/Settings/settings_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}


class _EditProfilePageState extends State<EditProfilePage> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController passwordController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  int minLength = 6;
  bool showPassword = false;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blueAccent,
          ),
          onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> settings_page()));
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
       child: Form(
        key: _formkey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Change Password",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 35,
              ),
             // buildTextField("E-mail", "example@mail.com", false),
              // buildTextField("Current Password", "********", true),
              buildTextField("New Password", " ********", true),
             // buildTextField("Location", "TLV, Israel", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> settings_page()));
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      print(passwordController.text);
                      var firebaseUser = FirebaseAuth.instance.currentUser;

                      if (_formkey.currentState.validate()) {
                           firestoreInstance
                             .collection("Person")
                             .doc(firebaseUser.uid)
                             .update({"password; ": passwordController.text})
                              .then((_) {
                             print("success!");
                             ScaffoldMessenger.of(context)
                                 .showSnackBar(SnackBar(
                                 content: Text('New password updated!')));
                             passwordController.clear();
                           }).catchError((onError) {
                             ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(content: Text(onError)));
                           });
                               }
                    },
                    color: Colors.blueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],

              ),
              SizedBox(
                child: Container(
                  child: Image.asset(
                    "assets/images/catdoglove.png",
                    height:100,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      ),


    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {

      return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextFormField(
        obscureText: isPasswordTextField ? showPassword : false,
        controller: passwordController,

        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
            ),

            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
            //  fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        validator: (String value){
          if (value.isEmpty) {
            return "Password Required";
          } else if (value.length < 6) {
            return "Password should be at least 6 characters";
          }else
            return null;
        },

      ),
    );
  }
}

