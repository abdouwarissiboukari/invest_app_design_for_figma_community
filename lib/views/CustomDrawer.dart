import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invest_app/controllers/LoginPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/SvgData.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomInkWell.dart';
import 'package:invest_app/views/CustomTextView.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  final contactInfo = "Contact Info";
  final sourceofFundingInfo = "Source of Funding Info";
  final bankAccountInfo = "Bank Account Info";
  final documentInfo = "Document Info";
  final settings = "Settings";
  final logout = "Logout";
  final addAccount = "Add account";
  late ExpandableController expandableController;

  @override
  void initState() {
    super.initState();
    expandableController = ExpandableController();
  }

  @override
  void dispose() {
    expandableController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.watch<DataProvider>().appBackgroundColor_dp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            child: ListView(
              shrinkWrap: true,
              children: [
                drawerTop(),
                ExpandablePanel(
                  controller: expandableController,
                  collapsed: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                  expanded: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, bottom: 5),
                          child: Row(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        AssetImage(userConnected.getUrlProfile),
                                    radius: 17,
                                  ),
                                  Transform.translate(
                                    offset: const Offset(20, 16),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: context
                                              .watch<DataProvider>()
                                              .appBackgroundColor_dp,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(17))),
                                      padding: const EdgeInsets.all(0.5),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: appPrimaryColor,
                                        size: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                userConnected.fullName,
                                style: GoogleFonts.signika(
                                  color: context
                                      .watch<DataProvider>()
                                      .appTextColor_dp,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomInkWell(
                        onTap: () {},
                        textValue: addAccount,
                        iconLeft: Icon(
                          Icons.add,
                          color: context.watch<DataProvider>().appTextColor_dp,
                        ),
                        iconRight: const SizedBox(
                          height: 0,
                          width: 0,
                        ),
                      ),
                      Divider()
                    ],
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: contactInfo,
                  iconLeft: SvgPicture.string(
                    contactSvg,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                        context.watch<DataProvider>().appTextColor_dp,
                        BlendMode.srcIn),
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: sourceofFundingInfo,
                  iconLeft: SvgPicture.string(
                    fundingSvg,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                        context.watch<DataProvider>().appTextColor_dp,
                        BlendMode.srcIn),
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: bankAccountInfo,
                  iconLeft: SvgPicture.string(
                    bankSvg,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                        context.watch<DataProvider>().appTextColor_dp,
                        BlendMode.srcIn),
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: documentInfo,
                  iconLeft: SvgPicture.string(
                    documentSvg,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                        context.watch<DataProvider>().appTextColor_dp,
                        BlendMode.srcIn),
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
                CustomInkWell(
                  onTap: () {},
                  textValue: settings,
                  iconLeft: SvgPicture.string(
                    settingSvg,
                    height: 24,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                        context.watch<DataProvider>().appTextColor_dp,
                        BlendMode.srcIn),
                  ),
                  iconRight: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(), // <-- This will fill up any free-space
          // Everything from here down is bottom aligned in the drawer
          CustomInkWell(
            onTap: onLogout,
            textValue: logout,
            iconLeft: Icon(
              Icons.login_rounded,
              color: context.watch<DataProvider>().appTextColor_dp,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(userConnected.urlProfile),
                      radius: 30,
                    ),
                    Transform.translate(
                      offset: const Offset(15, -20),
                      child: CustomIconButton(
                        onPressed: () {
                          isDarkMode = !isDarkMode;
                          context
                              .read<DataProvider>()
                              .updateIsDarkMode(!isDarkMode);
                        },
                        icon: (context.watch<DataProvider>().blThemMode)
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        color: context.watch<DataProvider>().appTextColor_dp,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: CustomTextView(
                            fontSize: 15,
                            textValue: userConnected.fullName,
                            textColor: context
                                .watch<DataProvider>()
                                .appTextColorGray_dp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: CustomTextView(
                            textAlign: TextAlign.left,
                            fontSize: 13,
                            textValue: defaultAccount.accountNumber,
                            textColor: context
                                .watch<DataProvider>()
                                .appTextColorGray_dp,
                          ),
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(15, 0),
                      child: CustomIconButton(
                        onPressed: () {
                          setState(() {
                            expandableController.toggle();
                          });
                        },
                        icon: expandableController.expanded
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: context.watch<DataProvider>().appTextColor_dp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  onLogout() async {
    context.read<DataProvider>().setIsConnect(false);
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext ctx) => LoginPage(),
      ),
    );
  }
}
