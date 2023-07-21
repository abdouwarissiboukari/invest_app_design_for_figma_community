import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/AppColors.dart';

class BarItem {
  String label;
  String iconData;
  Widget page;

  Widget get icon => SvgPicture.string(iconData,
      height: 24,
      width: 24,
      colorFilter: ColorFilter.mode(
        appTextColor,
        BlendMode.srcIn,
      ));
  Widget get activeIcon => SvgPicture.string(
        iconData,
        height: 24,
        width: 24,
        colorFilter: ColorFilter.mode(appPrimaryColor, BlendMode.srcIn),
      );

  BottomNavigationBarItem get item => BottomNavigationBarItem(
        icon: icon,
        activeIcon: activeIcon,
        label: label,
      );

  Text get titleForApp => Text(
        label,
        style: GoogleFonts.signika(fontSize: 30),
      );

  BarItem({
    required this.label,
    required this.iconData,
    required this.page,
  });
}
