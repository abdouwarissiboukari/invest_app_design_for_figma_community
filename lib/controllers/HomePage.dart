import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/views/CustomDrawer.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomScaffoldWithIcon.dart';

class HomePage extends StatefulWidget {
  String strFullName;

  HomePage({
    super.key,
    required this.strFullName,
  });
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithIcon(
      drawer: CustomDrawer(),
      leadingIcon: Builder(
        builder: (context) => CustomIconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icons.menu,
            color: appIconColorGray),
      ),
      trailingIcon: CustomIconButton(
          onPressed: onNotificationIconPressed,
          icon: Icons.notifications_rounded,
          color: appIconColorGray),
      bodyWidget: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }

  onDrawerIconPressed() {
    Scaffold.of(context).openDrawer();
  }

  onNotificationIconPressed() {}
}
