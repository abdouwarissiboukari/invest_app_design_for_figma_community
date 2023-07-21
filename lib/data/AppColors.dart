import 'package:flutter/material.dart';
import 'package:invest_app/data/ColorsFromHexa.dart';
import 'package:invest_app/main.dart';

final Color appPrimaryColor = "#31A062".toColor();
final Color appButtonTextColor = "#FFFFFF".toColor();
final Color appRedColor = "#FE555D".toColor();

final Color appLigthColor = "#D3D2D2".toColor();
final Color appGrayColor = "#B3B3B3".toColor();
final Color appDarkColor = "#4F4F4F".toColor();
final Color appLightColorL = "#E7E7E7".toColor();
final Color appGrayColorText = "#474747".toColor();
final Color appImageOpacityColor = "#1E1C1C".toColor();

final Color appTextColor =
    (isDarkMode) ? "#FFFFFF".toColor() : "#000000".toColor();
final Color appTextColorGray = (isDarkMode) ? appLigthColor : appGrayColorText;
final Color appSubTextColorGray = (isDarkMode) ? appLigthColor : appGrayColor;
final Color appIconColorGray = (isDarkMode) ? appLigthColor : appGrayColor;
final Color appInputBorderColor =
    (isDarkMode) ? "#828282".toColor() : appDarkColor;

final Color appBackgroundColor = (isDarkMode) ? appDarkColor : appLightColorL;
final Color appWidgetBackgroundColor =
    (isDarkMode) ? "#000000".toColor() : "#FFFFFF".toColor();

List<Color> appPrimaryListColr = [
  "#31A078".toColor(),
  "#31A05F".toColor(),
];

List<Color> goldListColor = [
  "#F0C735".toColor(),
  "#D98F39".toColor(),
];

List<Color> silverListColor = [
  "#CAC9C9".toColor(),
  "#979797".toColor(),
];

List<Color> platinumListColor = [
  "#BA8DF3".toColor(),
  "#615EE2".toColor(),
];

List<Color> ultraListColor = [
  "#EF5DA8".toColor(),
  "#EF5DA8".toColor(),
];
