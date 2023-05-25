import 'package:flutter/material.dart';

class BestPlan {
  int id;
  String title;
  double discount;
  String urlImage;
  List<Color> planColors;

  String get getDiscount => "${discount.toInt()}% return";
  String get getUrlImage => "assets/$urlImage";

  BestPlan(
      {required this.id,
      required this.title,
      required this.discount,
      required this.urlImage,
      required this.planColors});
}
