import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Login/components/background.dart';
import 'package:petTracker/Screens/Signup/signup_screen.dart';
import 'package:petTracker/Screens/homePage/home_page.dart';
import 'package:petTracker/components/already_have_an_account_acheck.dart';
import 'package:petTracker/components/rounded_button.dart';
import 'package:petTracker/components/rounded_input_field.dart';
import 'package:petTracker/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petTracker/components/auth.dart';
class Body extends StatelessWidget {




  @override
  String e_maill ;
  String passwordd;
  AuthService _authService = AuthService();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Color(
                  0xFF1C2223),fontFamily: "Patua"),

            ),
            SizedBox(height: size.height * 0.03),

            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                e_maill=value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passwordd=value;
              },
            ),
            RoundedButton(
              text: "LOGIN",

              press: () {
                _authService.signIn(e_maill, passwordd).then((value) {
                  return
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home_page())
                    );
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
