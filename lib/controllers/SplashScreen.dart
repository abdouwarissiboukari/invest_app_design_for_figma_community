import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invest_app/controllers/HomePage.dart';
import 'package:invest_app/controllers/SignUpPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/OsThemeExtension.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      if (blIsConnected) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              strFullName: userFullName,
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
    blIsConnected = context.watch<DataProvider>().isConnect;
    isDarkMode = context.isDarkMode;
    blOsType = context
        .watch<DataProvider>()
        .osType; // Get the Device OS... iOS = tue, Android = false

    Size size = MediaQuery.of(context).size;
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
              left: size.height * 0.14,
              right: size.height * 0.14,
              top: size.height * 0.28,
            ),
            width: size.width,
            height: size.height * 0.6,
            child: Image.asset(
              splashScreenUrl,
            ),
          ),
          Container(
            height: size.height * 0.3,
          ),
          SizedBox(
              width: size.width * 0.6,
              child: LinearProgressIndicator(
                backgroundColor: appPrimaryColor.withOpacity(0.2),
                color: appPrimaryColor,
                minHeight: 1,
              ))
        ],
      ),
    );
  }
}
