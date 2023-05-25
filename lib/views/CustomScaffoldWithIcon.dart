import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class CustomScaffoldWithIcon extends StatelessWidget {
  Widget drawer;
  Widget bodyWidget;
  String appTitleText;
  Widget leadingIcon;
  Widget trailingIcon;

  CustomScaffoldWithIcon({
    super.key,
    this.appTitleText = "",
    required this.leadingIcon,
    required this.trailingIcon,
    required this.bodyWidget,
    required this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return (blOsType) ? iOSScaffold(context) : androidScaffold(context);
  }

  Text appTitle() => Text(
        appTitleText,
      );

  CupertinoPageScaffold iOSScaffold(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
        leading: leadingIcon,
        brightness: Brightness.light,
        middle: appTitle(),
        trailing: trailingIcon,
      ),
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      child: bodyWidget,
    );
  }

  Scaffold androidScaffold(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
        leading: leadingIcon,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              trailingIcon,
            ],
          ),
        ],
        title: appTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      body: bodyWidget,
    );
  }
}
