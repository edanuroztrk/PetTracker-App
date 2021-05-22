import 'package:flutter/material.dart';
import 'package:petTracker/Screens/Login/components/background.dart';
import 'package:petTracker/Screens/Signup/signup_screen.dart';
import 'package:petTracker/Screens/homePage/homee_page.dart';
import 'package:petTracker/components/already_have_an_account_acheck.dart';
import 'package:petTracker/components/rounded_button.dart';
import 'package:petTracker/components/rounded_input_field.dart';
import 'package:petTracker/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
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
                  0xFF521F1E),fontFamily: "Patua"),

            ),
            SizedBox(height: size.height * 0.03),

            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",

              press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home_page()),
                  );
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
