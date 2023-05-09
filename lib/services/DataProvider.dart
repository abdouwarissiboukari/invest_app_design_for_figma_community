import 'package:flutter/material.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataPreferences.dart';

class DataProvider with ChangeNotifier {
  bool isConnect = false;
  String strFullName = "";
  final String keyIsConnect = "IsConnect";
  final String keyFullName = "FullName";

  DataProvider() {
    getUserInfo();
    blIsConnected = isConnect;
  }

  getIsConnect() async {
    isConnect = await DataPreferences().getIsConnect();

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
