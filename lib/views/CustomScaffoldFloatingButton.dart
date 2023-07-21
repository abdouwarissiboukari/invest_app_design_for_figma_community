import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomTextView.dart';
import 'package:provider/provider.dart';

class CustomScaffoldFloatingButton extends StatelessWidget {
  Widget bodyWidget;
  String appTitleText;
  Widget leadingIcon;
  Widget trailingIcon;
  Widget floatingIcon;
  Widget floatingLabel;
  Function() floatingOnPressed;
  Color floatingBackgroundColor;

  CustomScaffoldFloatingButton({
    super.key,
    this.appTitleText = "",
    required this.leadingIcon,
    required this.trailingIcon,
    required this.floatingIcon,
    required this.floatingLabel,
    required this.floatingOnPressed,
    required this.floatingBackgroundColor,
    required this.bodyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return (blOsType) ? iOSScaffold(context) : androidScaffold(context);
  }

  CupertinoPageScaffold iOSScaffold(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
        leading: leadingIcon,
        brightness: Brightness.light,
        middle: CustomTextView(
          textValue: appTitleText,
          textColor: context.watch<DataProvider>().appTextColor_dp,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        trailing: trailingIcon,
      ),
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      child: bodyWidget,
    );
  }

  Scaffold androidScaffold(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
        leading: Center(
          child: leadingIcon,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Center(
                  child: trailingIcon,
                ),
              ),
            ],
          ),
        ],
        title: CustomTextView(
          textValue: appTitleText,
          textColor: context.watch<DataProvider>().appTextColor_dp,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      body: bodyWidget,
      floatingActionButton: FloatingActionButton.extended(
        isExtended: context.watch<DataProvider>().isExtended_bankAccountPage,
        onPressed: floatingOnPressed,
        backgroundColor: floatingBackgroundColor,
        icon: floatingIcon,
        label: floatingLabel,
      ),
    );
  }
}
