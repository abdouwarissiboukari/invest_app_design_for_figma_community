import 'package:flutter/material.dart';

class TranformRotateIcon extends StatelessWidget {
  double angle;
  IconData icon;
  double iconSize;
  Color color;

  TranformRotateIcon({
    super.key,
    required this.angle,
    required this.icon,
    required this.iconSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Transform.rotate(
        angle: angle,
        child: Icon(
          icon,
          size: iconSize,
          color: color,
        ),
      ),
    );
  }
}
