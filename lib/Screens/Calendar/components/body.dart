import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petTracker/components/rounded_button.dart';


class calendarBody extends StatelessWidget {
  const calendarBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RoundedButton(
        text: "deneme",
        press: () { _onPressed(); },
      )
    );
  }

  void _onPressed() {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("users").add(
        {
          "name" : "sueda",
          "age" : 23,
          "email" : "example@example.com",

        }).then((value){
      print(value.id);
    });
  }



}
