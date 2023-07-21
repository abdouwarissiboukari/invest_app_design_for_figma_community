import 'dart:math';

import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/ColorsFromHexa.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataPreferences.dart';

import '../data/DefaultData.dart';
import '../models/BestPlan.dart';

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
  Color appSubTextColorGray_dp = appSubTextColorGray;
  Color appWidgetBackgroundColor_dp = appWidgetBackgroundColor;
  String splashScreenUrl_dp =
      (isDarkMode) ? "assets/dark_sc.png" : "assets/ligth_sc.png";
  bool isFilled_dp = false;
  bool isExtended_bankAccountPage = false;

  List<BestPlan> bestPlans_dp = DefaultData().allBestPlans();
  List<BestPlan> bestPlansSearchResult_dp = [];

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
    appTextColorGray_dp = (isDarkMode) ? appLigthColor : appGrayColorText;
    appSubTextColorGray_dp = (isDarkMode) ? appLigthColor : appGrayColor;
    appIconColorGray_dp = (isDarkMode) ? appLigthColor : appDarkColor;
    appInputBorderColor_dp = (isDarkMode) ? "#828282".toColor() : appDarkColor;
    appBackgroundColor_dp = (isDarkMode) ? appDarkColor : appLightColorL;
    appWidgetBackgroundColor_dp =
        (isDarkMode) ? "#000000".toColor() : "#FFFFFF".toColor();
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

  setIsSearchFilled(bool value) {
    isFilled_dp = value;
    notifyListeners();
  }

  setIsExtendedBankAccountPage(bool value) {
    isExtended_bankAccountPage = value;
    notifyListeners();
  }

  searchPlans(String value) {
    if (value.isNotEmpty) {
      bestPlans_dp = DefaultData()
          .allBestPlans()
          .where((x) => x.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      bestPlans_dp = DefaultData().allBestPlans();
    }

    notifyListeners();
  }

  searchPlanResult(String value) {
    if (value.isNotEmpty) {
      bestPlansSearchResult_dp = DefaultData()
          .allBestPlans()
          .where((x) => x.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      bestPlansSearchResult_dp = [];
    }

    notifyListeners();
  }
}
