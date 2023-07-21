import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, bottom: 5),
          child: Row(
            children: [
              Center(
                child: iconLeft,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                textValue,
                style: GoogleFonts.signika(
                  color: context.watch<DataProvider>().appTextColor_dp,
                  fontSize: 15,
                ),
                textAlign: TextAlign.left,
              ),
              const Spacer(),
              Center(
                child: iconRight,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
