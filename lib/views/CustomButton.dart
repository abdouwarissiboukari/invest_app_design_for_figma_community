import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/main.dart';

class CustomButton extends StatelessWidget {
  double width;
  String buttonTex;
  Color buttonColor;
  Color textColor;
  double textSize;
  Function() onButtonPressed;

  CustomButton({
    super.key,
    required this.onButtonPressed,
    required this.buttonTex,
    required this.width,
    required this.buttonColor,
    required this.textColor,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: (blOsType) ? androidButton() : androidButton());
  }

  Widget iOSButton() {
    return CupertinoButton(
      color: buttonColor,
      borderRadius: BorderRadius.circular(15),
      onPressed: onButtonPressed,
      child: Text(
        buttonTex,
        style: GoogleFonts.signika(
          color: textColor,
          fontSize: textSize,
        ),
      ),
    );
  }

  Widget androidButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, 60),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onButtonPressed,
      child: Text(
        buttonTex,
        style: GoogleFonts.signika(
          color: textColor,
          fontSize: textSize,
        ),
      ),
    );
  }
}
