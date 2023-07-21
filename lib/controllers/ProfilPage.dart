import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invest_app/controllers/BankAccountInfoPage.dart';
import 'package:invest_app/controllers/ContactInfoPage.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomScaffold.dart';
import 'package:provider/provider.dart';

import '../data/SvgData.dart';
import '../main.dart';
import '../services/DataProvider.dart';
import '../views/CustomIconButtonSvg.dart';
import '../views/CustomInkWell.dart';
import '../views/CustomTextView.dart';
import 'LoginPage.dart';

class ProfilPage extends StatelessWidget {
  final String profilTitleText = "Profil";
  final contactInfo = "Contact Info";
  final sourceofFundingInfo = "Source of Funding Info";
  final bankAccountInfo = "Bank Account Info";
  final documentInfo = "Document Info";
  final settings = "Settings";
  final logout = "Logout";
  final addAccount = "Add account";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      leadingIcon: CustomIconButtonSvg(
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed('HomeRoute'),
        icon: backArrowSvg,
        color: context.watch<DataProvider>().appTextColor_dp,
      ),
      trailingIcon: const SizedBox(
        width: 0,
        height: 0,
      ),
      bodyWidget: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextView(
                      textValue: profilTitleText,
                      textColor: context.watch<DataProvider>().appTextColor_dp,
                      fontSize: 34,
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.watch<DataProvider>().appTextColor_dp,
                        ),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: CustomIconButtonSvg(
                        onPressed: () async {
                          Provider.of<DataProvider>(context, listen: false)
                              .setIsConnect(false);
                          Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext ctx) => LoginPage(),
                            ),
                            (_) => false,
                          );
                        },
                        icon: logoutSvg,
                        color: context.watch<DataProvider>().appTextColor_dp,
                        heigth: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(userConnected.urlProfile),
                    radius: 75,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextView(
                    fontSize: 22,
                    textValue: userConnected.fullName,
                    textColor: context.watch<DataProvider>().appTextColor_dp,
                  ),
                  CustomTextView(
                    fontSize: 15,
                    textValue: userConnected.level,
                    textColor:
                        context.watch<DataProvider>().appTextColorGray_dp,
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            customSilverToAdapter(
              onItemTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext ctx) => ContactInfoPage(),
                ),
              ),
              context: context,
              textValue: contactInfo,
              iconLeft: contactSvg,
            ),
            customSilverToAdapter(
              onItemTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext ctx) => BankAccountInfoPage(),
                ),
              ),
              context: context,
              textValue: sourceofFundingInfo,
              iconLeft: fundingSvg,
            ),
            customSilverToAdapter(
              onItemTap: () {},
              context: context,
              textValue: bankAccountInfo,
              iconLeft: bankSvg,
            ),
            customSilverToAdapter(
              onItemTap: () {},
              context: context,
              textValue: documentInfo,
              iconLeft: documentSvg,
            ),
            customSilverToAdapter(
              onItemTap: () {},
              context: context,
              textValue: settings,
              iconLeft: settingSvg,
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter customSilverToAdapter({
    required BuildContext context,
    required String textValue,
    required String iconLeft,
    required Function() onItemTap,
  }) {
    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Card(
          color: context.watch<DataProvider>().appWidgetBackgroundColor_dp,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomInkWell(
              onTap: onItemTap,
              textValue: textValue,
              iconLeft: SvgPicture.string(
                iconLeft,
                height: 24,
                width: 24,
                colorFilter: ColorFilter.mode(
                    context.watch<DataProvider>().appTextColor_dp,
                    BlendMode.srcIn),
              ),
              iconRight: Container(
                height: 30,
                width: 30,
                padding: const EdgeInsets.all(3),
                child: SvgPicture.string(
                  forwardSvg,
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                      context.watch<DataProvider>().appTextColor_dp,
                      BlendMode.srcIn),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
