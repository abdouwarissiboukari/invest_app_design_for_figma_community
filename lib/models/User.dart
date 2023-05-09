import 'package:invest_app/models/Gender.dart';

class User {
  int id;
  String fullName;
  DateTime birthdate;
  Gender gender;
  String email;
  String phoneNumber;
  String address;
  String urlProfile;

  String get getUrlProfile => "assets/$urlProfile";

  User({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.birthdate,
    required this.email,
    this.address = "",
    this.phoneNumber = "",
    this.urlProfile = "",
  });
}
