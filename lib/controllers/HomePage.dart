import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/controllers/AllBestPlansPage.dart';
import 'package:invest_app/controllers/MyAsset.dart';
import 'package:invest_app/controllers/NotificationPage.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/data/DefaultData.dart';
import 'package:invest_app/main.dart';
import 'package:invest_app/models/BestPlan.dart';
import 'package:invest_app/models/InvestementGuide.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomButton.dart';
import 'package:invest_app/views/CustomDrawer.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomIconButtonSvg.dart';
import 'package:invest_app/views/CustomPlanCard.dart';
import 'package:invest_app/views/CustomScaffoldWithIcon.dart';
import 'package:invest_app/views/CustomTextView.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';
import 'package:provider/provider.dart';

import '../data/SvgData.dart';

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
  final strWelcome = "Welcome, ${userConnected.fullName}";
  final yourTotalAssetPortfolioText = "Your total asset portfolio";
  final investNowText = "Invest now";
  final bestPlansText = "Best Plans";
  final seeAllText = "See All";
  final investmentGuideText = "Investment Guide";

  List<BestPlan> bestPlans =
      DefaultData().allBestPlans().where((x) => x.id < 3).toList();

  List<InvestementGuide> investementGuides =
      DefaultData().allInvestementGuide();

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldWithIcon(
      drawer: CustomDrawer(),
      leadingIcon: (blOsType)
          ? Container()
          : Builder(
              builder: (context) => CustomIconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icons.menu,
                color: context.watch<DataProvider>().appTextColor_dp,
              ),
            ),
      trailingIcon: CustomIconButtonSvg(
        onPressed: onNotificationIconPressed,
        icon: notificationSvg,
        color: context.watch<DataProvider>().appTextColor_dp,
      ),
      bodyWidget: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 7,
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomTitleTextView(
                      textValue: strWelcome,
                      textColor: context.watch<DataProvider>().appTextColor_dp,
                      textSize: 32,
                      textMaxLine: 1,
                    ),
                    Card(
                      margin: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 34,
                      ),
                      color: appPrimaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        width: deviceSize.width,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: const Alignment(0.8, 1),
                              end: Alignment.bottomLeft,
                              colors: appPrimaryListColr,
                              tileMode: TileMode.mirror),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                CustomTextView(
                                  textValue: yourTotalAssetPortfolioText,
                                  textColor: appLightColorL,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomTextView(
                                  textValue: defaultAccount.getAccountBalance,
                                  textColor: appLightColorL,
                                  fontSize: 32,
                                ),
                                SizedBox(
                                  height: 40,
                                  // width: 100,
                                  child: CustomButton(
                                    onButtonPressed: () {},
                                    buttonTex: investNowText,
                                    width: 100,
                                    buttonColor: appLightColorL,
                                    textColor: appPrimaryColor,
                                    textSize: 14,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextView(
                        textValue: bestPlansText,
                        textColor:
                            context.watch<DataProvider>().appTextColor_dp,
                        fontSize: 22,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    AllBestPlansPage()),
                          );
                        },
                        child: Row(
                          children: [
                            CustomTextView(
                              textValue: seeAllText,
                              textColor: appRedColor,
                              fontSize: 18,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: appRedColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  color: Colors.transparent,
                  height: 170,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => CustomPlanCard(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext btx) => MyAsset(
                              bestPlan: bestPlans[index],
                              fromPage: 0,
                            ),
                          ),
                        );
                      },
                      bestPlan: bestPlans[index],
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 7,
                    ),
                    itemCount: bestPlans.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: CustomTextView(
                    textValue: investmentGuideText,
                    textColor: context.watch<DataProvider>().appTextColor_dp,
                    fontSize: 22,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => InkWell(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: deviceSize.width * 0.6,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: CustomTextView(
                                          textValue:
                                              investementGuides[index].title,
                                          textColor: context
                                              .watch<DataProvider>()
                                              .appTextColor_dp,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: CustomTextView(
                                          textValue: investementGuides[index]
                                              .description,
                                          textColor: context
                                              .watch<DataProvider>()
                                              .appTextColorGray_dp,
                                          fontSize: 14,
                                          textMaxLine: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                      investementGuides[index].getUrlImage),
                                ),
                              ],
                            ),
                            const Divider(),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ),
                  childCount: investementGuides.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onNotificationIconPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext btx) => NotificationPage()),
    );
  }
}
