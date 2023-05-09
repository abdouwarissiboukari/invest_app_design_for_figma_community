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

  Future<Map<String, dynamic>> getUserInfo() async {
    final preferences = await SharedPreferences.getInstance();
    final isConnect = preferences.getBool(keyIsConnect) ?? false;
    final fullName = preferences.getString(keyFullName) ?? "";

    return {keyIsConnect: isConnect, keyFullName: fullName};
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

  Future<bool> setUserInfo(Map<String, dynamic> map) async {
    bool isSet = false;
    final preferences = await SharedPreferences.getInstance();

    preferences
        .setBool(keyIsConnect, map[keyIsConnect])
        .then((value) => isSet = true)
        .catchError((onError) => isSet = false);

    preferences
        .setString(keyFullName, map[keyFullName])
        .catchError((onError) => isSet = false);

    return isSet;
  }
}
