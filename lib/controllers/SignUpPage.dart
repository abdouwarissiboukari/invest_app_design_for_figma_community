import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/controllers/CreateAccountPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/views/CustomButton.dart';
import 'package:invest_app/views/CustomScaffoldLight.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  String signUpUrl = "assets/signups.png";
  String signUpTitle = "Stay on top of your finance with us.";
  String signUpDescription =
      "We are your new financial Advisors to recommed the best investments for you.";
  String signUpButtonText = "Create account";
  String loginText = "Login";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScaffoldLight(
      bodyWidget: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: size.height * 0.1,
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.25,
                  child: Image.asset(
                    signUpUrl,
                  ),
                ),
                CustomTitleTextView(
                  textValue: signUpTitle,
                  textColor: appTextColor,
                  textMaxLine: 2,
                  textSize: 30,
                ),
                CustomTitleTextView(
                  textValue: signUpDescription,
                  textColor: appTextColorGray,
                  textMaxLine: 2,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  width: size.width,
                  // height: size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomButton(
                          onButtonPressed: onSigninPressed,
                          buttonTex: signUpButtonText,
                          width: size.width,
                          buttonColor: appPrimaryColor),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          loginText,
                          style: GoogleFonts.signika(
                              color: appPrimaryColor, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onSigninPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext ctx) => CreateAccountPage(),
      ),
    );
  }
}
