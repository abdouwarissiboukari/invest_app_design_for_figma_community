import 'package:flutter/material.dart';
import 'package:invest_app/data/ColorsFromHexa.dart';
import 'package:invest_app/main.dart';

final Color appPrimaryColor = "#31A062".toColor();
final Color buttonTextColor = "#FFFFFF".toColor();

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
