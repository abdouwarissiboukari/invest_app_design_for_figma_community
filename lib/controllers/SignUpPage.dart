import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/controllers/CreateAccountPage.dart';
import 'package:invest_app/controllers/LoginPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomButton.dart';
import 'package:invest_app/views/CustomScaffoldLight.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';
import 'package:provider/provider.dart';

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
                  height: deviceSize.height * 0.1,
                ),
                Container(
                  width: deviceSize.width,
                  height: deviceSize.height * 0.25,
                  child: Image.asset(
                    signUpUrl,
                  ),
                ),
                CustomTitleTextView(
                  textValue: signUpTitle,
                  textColor: context.watch<DataProvider>().appTextColor_dp,
                  textMaxLine: 2,
                  textSize: 30,
                ),
                CustomTitleTextView(
                  textValue: signUpDescription,
                  textColor: context.watch<DataProvider>().appTextColorGray_dp,
                  textMaxLine: 2,
                ),
                SizedBox(
                  height: deviceSize.height * 0.05,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  width: deviceSize.width,
                  // height: size.height * 0.25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 17),
                        child: CustomButton(
                          onButtonPressed: onSigninPressed,
                          buttonTex: signUpButtonText,
                          width: deviceSize.width,
                          buttonColor: appPrimaryColor,
                          textColor: buttonTextColor,
                          textSize: 17,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext ctx) => LoginPage(),
                            ),
                          );
                        },
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
