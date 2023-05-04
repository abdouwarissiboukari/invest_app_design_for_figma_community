import 'package:shared_preferences/shared_preferences.dart';

class DataPreferences {
  final String keyIsConnect = "IsConnect";
  final String keyFullName = "FullName";

  Future<bool> getIsConnect() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(keyIsConnect) ?? false;
  }

  Future<String> getFullName() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(keyFullName) ?? "";
  }

  Future<bool> setIsConnect(bool value) async {
    bool isSet = false;
    final preferences = await SharedPreferences.getInstance();

    preferences
        .setBool(keyIsConnect, value)
        .then((success) => isSet = true)
        .catchError((error) => isSet = false);

    return isSet;
  }

  Future<bool> setFullName(String value) async {
    bool isSet = false;
    final preferences = await SharedPreferences.getInstance();

    preferences
        .setString(keyFullName, value)
        .then((success) => isSet = true)
        .catchError((error) => isSet = false);

    return isSet;
  }
}
