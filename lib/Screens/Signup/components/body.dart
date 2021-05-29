import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Login/login_screen.dart';
import 'package:petTracker/Screens/Signup/components/background.dart';
import 'package:petTracker/Screens/homePage/home_page.dart';
import 'package:petTracker/components/already_have_an_account_acheck.dart';
import 'package:petTracker/components/auth.dart';
import 'package:petTracker/components/rounded_button.dart';
import 'package:petTracker/components/rounded_input_field.dart';
import 'package:petTracker/components/rounded_password_field.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
   String e_mail ;
   String password;
AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "SIGN UP",
                style: TextStyle(fontSize: 45.0),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                e_mail=value;
                           },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password=value;
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                _authService.createPerson(e_mail, password).then((value) {
                  return
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home_page())
                    );
                });
              }
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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

          ]
        ),
      ),
    );
  }
}
