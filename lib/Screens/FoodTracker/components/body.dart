import 'package:flutter/material.dart';
import 'package:petTracker/constants.dart';

class FoodTrackerBody extends StatefulWidget {
  @override
  _FoodTrackerPageState createState() => _FoodTrackerPageState();
}

class _FoodTrackerPageState extends State<FoodTrackerBody> {
  bool _isChecked = false;
  bool food = false;
  bool water = false;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            height: 95,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: primary, blurRadius: 0.5)
                        ]),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:  Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Text("Don't forget to feed your pet!\nKeep your pet hydrated! ",style:contentWhite,),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Image.asset("assets/images/dog.png"),
                )

              ],
            ),

          ),
          Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
            child: CheckboxListTile(
              title: const Text('Morning food'),
              subtitle: const Text('The amount of food varies according to your pet.'),
              secondary: const Icon(Icons.pets),
              activeColor: Colors.indigo,
              checkColor: Colors.white,
              selected: _isChecked,
              value: _isChecked,
              onChanged: (bool value) {
                setState(() {
                  _isChecked = value;
                });
              },
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
              ),
            ),
          ),
          Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
            child: CheckboxListTile(
              title: const Text('Morning water'),
              subtitle: const Text("Don't forget to refresh the water."),
              secondary: const Icon(Icons.pets),
              activeColor: Colors.indigo,
              checkColor: Colors.white,
              selected: food,
              value: food,
              onChanged: (bool value) {
                setState(() {
                  food = value;
                });
              },
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
              ),
            ),
          ),
          Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
            child: CheckboxListTile(
              title: const Text('Evening Food'),
              subtitle: const Text('The amount of food varies according to your pet.'),
              secondary: const Icon(Icons.pets),
              activeColor: Colors.indigo,
              checkColor: Colors.white,
              selected: water,
              value: water,
              onChanged: (bool value) {
                setState(() {
                  water = value;
                });
              },
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
              ),
            ),
          ),
          Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
            child: CheckboxListTile(
              title: const Text('Evening Water'),
              subtitle: const Text("Don't forget to refresh the water." ),
              secondary: const Icon(Icons.pets),
              activeColor: Colors.indigo,
              checkColor: Colors.white,
              selected: check,
              value: check,
              onChanged: (bool value) {
                setState(() {
                  check = value;
                });
              },
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10
              ),
            ),
          ),
        ]
    );
  }
}