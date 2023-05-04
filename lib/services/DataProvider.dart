import 'dart:io';

import 'package:flutter/material.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataPreferences.dart';

class DataProvider with ChangeNotifier {
  bool isConnect = false;
  late bool osType;
  String strFullName = "";

  DataProvider() {
    getOsType();
    getIsConnect();
    blIsConnected = isConnect;
    if (blIsConnected) {
      getFullName();
      userFullName = strFullName;
    }
  }

  getIsConnect() async {
    isConnect = await DataPreferences().getIsConnect();

    notifyListeners();
  }

  getFullName() async {
    strFullName = await DataPreferences().getFullName();

    notifyListeners();
  }

  setIsConnect(bool value) async {
    bool isSuccess = await DataPreferences().setIsConnect(value);

    if (isSuccess) {
      isConnect = value;
    }
    notifyListeners();
  }

  setFullName(String value) async {
    bool isSuccess = await DataPreferences().setFullName(value);

    if (isSuccess) {
      strFullName = value;
    }
    notifyListeners();
  }

  getOsType() {
    osType = (Platform.isIOS ? true : false);
    notifyListeners();
  }
}
