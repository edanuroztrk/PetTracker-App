import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class profileBody extends StatelessWidget {
  const profileBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          SizedBox(height: 16,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: <Widget>[

                  petPicture(pic: 'assets/images/profile_cat.png'),
                  SizedBox(width: 16,),


                ],


              ),
              ),

          SizedBox(height: 16,),
          //pet name giver
          PetProfileHeader(petInfo : "Mimi"),



        ],


    );
  }
}



class petPicture extends StatelessWidget {
  final String pic;
  const petPicture({Key key,this.pic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.25  ,
          height:  200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(pic),
                fit: BoxFit.cover),
          ),
        ) ,

      ),
    );
  }
}



class PetProfileHeader extends StatelessWidget {
  final String petInfo;
  const PetProfileHeader({Key key, this.petInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Mimi's Profile",
              style: new TextStyle(
                  fontSize: 27.0,
                  color: Color(0xFFF56014),
                  fontWeight: FontWeight.w500
                  ,fontFamily: "Patua")),
        ),

        Text(
          'Bleed: Scottish',
          style: TextStyle(
              color: Color(0xFFBA6439),
              fontSize: 18.0,
              fontWeight: FontWeight.w500
              ,fontFamily: "Patua"),
        ),
        Text(
          'Age:23 months',
          style: TextStyle(
              color: Color(0xFFBA6439),
              fontSize: 18.0,
              fontWeight: FontWeight.w500
              ,fontFamily: "Patua"),
        ),
        Text(
          'Weight:2 kgs',
          style: TextStyle(
              color: Color(0xFFBA6439),
              fontSize: 18.0,
              fontWeight: FontWeight.w500
              ,fontFamily: "Patua"),
        ),


        Icon(
          Icons.edit,
          color: Color(0xE2E7AC0F),
          size: 30.0,
        ),






      ],

    );
  }
}










