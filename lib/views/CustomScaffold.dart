import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class CustomScaffold extends StatelessWidget {
  Widget bodyWidget;
  String appTitleText;

  CustomScaffold({super.key, required this.bodyWidget, this.appTitleText = ""});

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
        brightness: Brightness.light,
        middle: appTitle(),
      ),
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      child: bodyWidget,
    );
  }

  Scaffold androidScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      body: bodyWidget,
    );
  }
}
