import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Login/login_screen.dart';
import 'package:petTracker/Screens/Signup/signup_screen.dart';
import 'package:petTracker/Screens/Welcome/components/background.dart';
import 'package:petTracker/components/rounded_button.dart';
import 'package:petTracker/constants.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(

      child: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "PET TRACKER",

              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color:
              Color(0xFF1F2421),fontFamily: "Patua"),
            ),
            SizedBox(height: size.height * 0.02),
                Container(

                  child: Image.asset(
                    "assets/images/pet_dog.png",

                    height: size.height * 0.45,

                  ),
                ),

            SizedBox(height: size.height*0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Color(0xFF1F2421),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
