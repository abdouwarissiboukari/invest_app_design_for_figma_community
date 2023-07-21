import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class CustomScaffoldWithBottomBar extends StatelessWidget {
  Widget bodyWidget;

  CustomScaffoldWithBottomBar({super.key, required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return (blOsType) ? iOSScaffold(context) : androidScaffold(context);
  }

  CupertinoPageScaffold iOSScaffold(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      child: bodyWidget,
    );
  }

  Scaffold androidScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      body: bodyWidget,
    );
  }
}
