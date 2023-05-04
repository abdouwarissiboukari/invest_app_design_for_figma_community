import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:provider/provider.dart';

class CustomScaffoldWithIcon extends StatelessWidget {
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
  });

  @override
  Widget build(BuildContext context) {
    return (context.watch<DataProvider>().osType)
        ? iOSScaffold(context)
        : androidScaffold(context);
  }

  Text appTitle() => Text(
        appTitleText,
      );

  CupertinoPageScaffold iOSScaffold(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        brightness: Brightness.light,
        middle: appTitle(),
      ),
      backgroundColor: appBackgroundColor,
      child: bodyWidget,
    );
  }

  Scaffold androidScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
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
      backgroundColor: appBackgroundColor,
      body: bodyWidget,
    );
  }
}
