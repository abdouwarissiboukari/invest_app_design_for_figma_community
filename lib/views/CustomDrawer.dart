import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/views/CustomInkWell.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';

class CustomDrawer extends StatelessWidget {
  final contactInfo = "Contact Info";
  final sourceofFundingInfo = "Source of Funding Info";
  final bankAccountInfo = "Bank Account Info";
  final documentInfo = "Document Info";
  final settings = "Settings";
  final Logout = "Logout";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                drawerTop(),
                CustomInkWell(
                  onTap: () {},
                  textValue: contactInfo,
                  iconLeft: Icon(
                    Icons.contacts,
                    color: appTextColor,
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: sourceofFundingInfo,
                  iconLeft: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: appTextColor,
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: bankAccountInfo,
                  iconLeft: Icon(
                    Icons.account_balance_outlined,
                    color: appTextColor,
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: documentInfo,
                  iconLeft: Icon(
                    Icons.insert_drive_file_outlined,
                    color: appTextColor,
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: settings,
                  iconLeft: Icon(
                    Icons.settings,
                    color: appTextColor,
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
              ],
            ),
          ),
          Spacer(), // <-- This will fill up any free-space
          // Everything from here down is bottom aligned in the drawer
          CustomInkWell(
            onTap: () {},
            textValue: Logout,
            iconLeft: Icon(
              Icons.login_rounded,
              color: appTextColor,
            ),
            iconRight: const SizedBox(
              height: 0,
              width: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerTop() {
    return DrawerHeader(
      child: Row(
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userConnected.getUrlProfile),
                  radius: 40,
                ),
                CustomTitleTextView(
                    textValue: userConnected.fullName,
                    textColor: appTextColorGray),
              ],
            ),
          )
        ],
      ),
    );
  }
}
