import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class CustomScaffoldLight extends StatelessWidget {
  Widget bodyWidget;

  CustomScaffoldLight({super.key, required this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return (context.watch<DataProvider>().osType)
        ? iOSScaffold()
        : androidScaffold();
  }

  CupertinoPageScaffold iOSScaffold() {
    return CupertinoPageScaffold(
      backgroundColor: appBackgroundColor,
      child: bodyWidget,
    );
  }

  Scaffold androidScaffold() {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      body: bodyWidget,
    );
  }
}
