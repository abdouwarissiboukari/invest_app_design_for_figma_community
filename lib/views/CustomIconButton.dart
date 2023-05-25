import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  Function() onPressed;
  IconData icon;
  Color color;

  CustomIconButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
    );
  }
}
