import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/data/AppColors.dart';

class CustomTextView extends StatelessWidget {
  String textValue;
  double fontSize;
  FontWeight fontWeight;
  Color textColor;
  TextAlign textAlign;
  int textMaxLine;

  CustomTextView({
    super.key,
    required this.textValue,
    this.fontSize = 17,
    this.textMaxLine = 1,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: GoogleFonts.signika(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
      maxLines: textMaxLine,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
