import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/ColorsFromHexa.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataPreferences.dart';

class DataProvider with ChangeNotifier {
  bool isConnect = false;
  bool blThemMode = isDarkMode;
  String strFullName = "";
  final String keyIsConnect = "IsConnect";
  final String keyFullName = "FullName";
  Color appTextColor_dp = appTextColor;
  Color appTextColorGray_dp = appTextColorGray;
  Color appIconColorGray_dp = appIconColorGray;
  Color appInputBorderColor_dp = appInputBorderColor;
  Color appBackgroundColor_dp = appBackgroundColor;
  String splashScreenUrl_dp =
      (isDarkMode) ? "assets/dark_sc.png" : "assets/ligth_sc.png";

  DataProvider() {
    getUserInfo();
    blIsConnected = isConnect;
  }

  getIsConnect() async {
    isConnect = await DataPreferences().getIsConnect();

    notifyListeners();
  }

  updateIsDarkMode(bool value) {
    blThemMode = value;

    appTextColor_dp = (isDarkMode) ? "#FFFFFF".toColor() : "#000000".toColor();
    appTextColorGray_dp = (isDarkMode) ? appLigthColor : appDarkColor;
    appIconColorGray_dp = (isDarkMode) ? appLigthColor : appDarkColor;
    appInputBorderColor_dp = (isDarkMode) ? "#828282".toColor() : appDarkColor;
    appBackgroundColor_dp = (isDarkMode) ? appDarkColor : appLightColorL;
    splashScreenUrl_dp =
        (isDarkMode) ? "assets/dark_sc.png" : "assets/ligth_sc.png";

    notifyListeners();
  }

  getUserInfo() async {
    final map = await DataPreferences().getUserInfo();
    isConnect = map[keyIsConnect];
    strFullName = map[keyFullName];

    notifyListeners();
  }

  setIsConnect(bool value) async {
    bool isSuccess = await DataPreferences().setIsConnect(value);

    if (isSuccess) {
      isConnect = value;
    }
    notifyListeners();
  }

  setUserInfo({required bool isConnected, required String fullName}) async {
    bool isSuccess = await DataPreferences()
        .setUserInfo({keyIsConnect: isConnected, keyFullName: fullName});

    if (isSuccess) {
      isConnect = isConnected;
      strFullName = fullName;
    }

    notifyListeners();
  }
}
