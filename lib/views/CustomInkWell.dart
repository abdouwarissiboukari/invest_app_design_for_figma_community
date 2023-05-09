import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/data/AppColors.dart';

class CustomInkWell extends StatelessWidget {
  Function() onTap;
  Widget iconLeft;
  Widget iconRight;
  String textValue;

  CustomInkWell(
      {super.key,
      required this.onTap,
      required this.textValue,
      required this.iconLeft,
      required this.iconRight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, bottom: 5),
        child: Row(
          children: [
            iconLeft,
            const SizedBox(
              width: 20,
            ),
            Text(
              textValue,
              style: GoogleFonts.signika(color: appTextColor, fontSize: 17),
              textAlign: TextAlign.left,
            ),
            const Spacer(),
            iconRight,
          ],
        ),
      ),
    );
  }
}
