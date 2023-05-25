import 'package:flutter/material.dart';
import 'package:invest_app/data/ColorsFromHexa.dart';
import 'package:invest_app/main.dart';

final Color appPrimaryColor = "#31A062".toColor();
final Color buttonTextColor = "#FFFFFF".toColor();
final Color appRedColor = "#FE555D".toColor();

final Color appLigthColor = "#D3D2D2".toColor();
final Color appDarkColor = "#4F4F4F".toColor();
final Color appLightColorL = "#E7E7E7".toColor();

final Color appTextColor =
    (isDarkMode) ? "#FFFFFF".toColor() : "#000000".toColor();
final Color appTextColorGray = (isDarkMode) ? appLigthColor : appDarkColor;
final Color appIconColorGray = (isDarkMode) ? appLigthColor : appDarkColor;
final Color appInputBorderColor =
    (isDarkMode) ? "#828282".toColor() : appDarkColor;

final Color appBackgroundColor = (isDarkMode) ? appDarkColor : appLightColorL;

List<Color> goldListColor = [
  "#F0C735".toColor().withAlpha(90),
  "#EEC335".toColor(),
  "#ECBD36".toColor(),
  "#E9B636".toColor(),
  "#E2A637".toColor(),
  "#DD9938".toColor(),
  "#D98F39".toColor(),
];

List<Color> silverListColor = [
  "#CAC9C9".toColor().withAlpha(90),
  "#BEBEBE".toColor(),
  "#B9B9B9".toColor(),
  "#B2B2B2".toColor(),
  "#A7A7A7".toColor(),
  "#9F9F9F".toColor(),
  "#979797".toColor(),
];

List<Color> platinumListColor = [
  "#BA8DF3".toColor().withAlpha(90),
  "#A07FEE".toColor(),
  "#9378EC".toColor(),
  "#8672E9".toColor(),
  "#7669E6".toColor(),
  "#6D64E5".toColor(),
  "#615EE2".toColor(),
];
