import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invest_app/controllers/HomePage.dart';
import 'package:invest_app/controllers/SignUpPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/OsThemeExtension.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/models/Gender.dart';
import 'package:invest_app/models/User.dart';
import 'package:invest_app/services/DataPreferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    getIsConnected();
    Timer(const Duration(seconds: 3), () {
      if (blIsConnected) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              strFullName: userConnected.fullName,
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // blIsConnected = context.watch<DataProvider>().isConnect;
    // userFullName = context.watch<DataProvider>().strFullName;
    // blOsType = context
    //     .watch<DataProvider>()
    //     .osType; // Get the Device OS... iOS = tue, Android = false

    isDarkMode = context.isDarkMode;
    deviceSize = MediaQuery.of(context).size;
    String splashScreenUrl =
        (isDarkMode) ? "assets/dark_sc.png" : "assets/ligth_sc.png";

    return Container(
      color: appBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: deviceSize.height * 0.14,
              right: deviceSize.height * 0.14,
              top: deviceSize.height * 0.28,
            ),
            width: deviceSize.width,
            height: deviceSize.height * 0.6,
            child: Image.asset(
              splashScreenUrl,
            ),
          ),
          Container(
            height: deviceSize.height * 0.3,
          ),
          SizedBox(
            width: deviceSize.width * 0.6,
            child: LinearProgressIndicator(
              backgroundColor: appPrimaryColor.withOpacity(0.2),
              color: appPrimaryColor,
              minHeight: 1,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getIsConnected() async {
    blIsConnected = await DataPreferences().getIsConnect();
    if (blIsConnected) {
      userConnected = User(
        id: 1,
        fullName: "Warren Buffet",
        gender: Gender.male,
        birthdate: DateTime(1987, 4, 7),
        email: "warren.buff@invest.ai",
        urlProfile: "profil.png",
      );
    }
  }
}
