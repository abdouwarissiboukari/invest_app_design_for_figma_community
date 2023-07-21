import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomInkWell.dart';

class CustomSearchResultCard extends StatelessWidget {
  Function() onTap;
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  String textValue;
  Color iconColor;
  IconData iconLeft;
  IconData iconRight;

  CustomSearchResultCard({
    super.key,
    required this.onTap,
    required this.topLeft,
    required this.topRight,
    this.bottomLeft = 0,
    this.bottomRight = 0,
    required this.textValue,
    required this.iconColor,
    required this.iconLeft,
    required this.iconRight,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
          ),
        ),
        child: Container(
          height: 40,
          margin: const EdgeInsets.only(right: 20, bottom: 7),
          child: CustomInkWell(
            onTap: onTap,
            textValue: textValue,
            iconLeft: Icon(
              iconLeft,
              size: 15,
              color: iconColor,
            ),
            iconRight: Transform.rotate(
              angle: 45,
              child: Icon(
                iconRight,
                color: iconColor,
                size: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
