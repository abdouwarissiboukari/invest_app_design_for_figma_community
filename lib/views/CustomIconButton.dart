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
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }
}
