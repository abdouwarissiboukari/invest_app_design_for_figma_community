import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButtonSvg extends StatelessWidget {
  Function() onPressed;
  String icon;
  Color color;
  double heigth;
  double width;

  CustomIconButtonSvg({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.color,
    this.heigth = 24,
    this.width = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(4),
          height: heigth + 6,
          width: width + 6,
          child: SvgPicture.string(
            icon,
            height: heigth,
            width: heigth,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
