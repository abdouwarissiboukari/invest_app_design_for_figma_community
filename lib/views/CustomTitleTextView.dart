import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitleTextView extends StatelessWidget {
  String textValue;
  Color textColor;
  double textSize;
  int textMaxLine;
  TextAlign textAlign;
  FontWeight fontWeight;

  CustomTitleTextView({
    super.key,
    required this.textValue,
    required this.textColor,
    this.textMaxLine = 1,
    this.textSize = 17,
    this.textAlign = TextAlign.center,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      width: size.width,
      child: Text(
        textValue,
        style: GoogleFonts.signika(
          color: textColor,
          fontSize: textSize,
        ),
        maxLines: textMaxLine,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
