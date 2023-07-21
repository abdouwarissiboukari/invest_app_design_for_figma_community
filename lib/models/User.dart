import 'package:intl/intl.dart';
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
  String level;

  String get getUrlProfile => "assets/$urlProfile";
  String get getBirthdate =>
      '${DateFormat.d().format(birthdate)} ${DateFormat.LLLL().format(birthdate)} ${DateFormat.y().format(birthdate)}';

  User({
    required this.id,
    required this.fullName,
    required this.gender,
    required this.birthdate,
    required this.email,
    required this.level,
    this.address = "-",
    this.phoneNumber = "-",
    this.urlProfile = "profil.png",
  });
}
