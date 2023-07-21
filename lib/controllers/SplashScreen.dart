import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invest_app/controllers/Home.dart';
import 'package:invest_app/controllers/SignUpPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/OsThemeExtension.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/models/Account.dart';
import 'package:invest_app/models/Gender.dart';
import 'package:invest_app/models/User.dart';
import 'package:invest_app/services/DataPreferences.dart';
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
    getIsConnected();

    Timer(const Duration(seconds: 3), () {
      if (blIsConnected) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
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
    isDarkMode = context.isDarkMode;
    deviceSize = MediaQuery.of(context).size;
    String splashScreenUrl =
        (isDarkMode) ? "assets/dark_sc.png" : "assets/ligth_sc.png";

    return Container(
      color: context.watch<DataProvider>().appBackgroundColor_dp,
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
              context.watch<DataProvider>().splashScreenUrl_dp,
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
        urlProfile: "assets/profil.png",
        level: "Expert",
      );

      defaultAccount = Account(
        userId: 1,
        accountNumber: "70009899443X",
        accountName: "House Investment",
        accountBalance: 203935,
      );
    }
  }
}
