import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/models/BestPlan.dart';
import 'package:invest_app/models/Transaction.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomIconButtonSvg.dart';
import 'package:provider/provider.dart';

import '../data/DefaultData.dart';
import '../data/SvgData.dart';
import '../main.dart';
import '../views/CustomPlanLargeCard.dart';
import '../views/CustomTextView.dart';
import 'AllBestPlansPage.dart';

class MyAsset extends StatelessWidget {
  BestPlan bestPlan;
  final String appTitleText = "My Asset";
  final String totalAssetText = "Your total asset portfolio";
  final String currentPlansText = "Current Plans";
  final String seeAllPlansText = "See All Plans";
  final String historyText = "History";
  int fromPage;
  List<Transaction> transactions = DefaultData().allTransactions();

  MyAsset({super.key, required this.bestPlan, required this.fromPage});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.watch<DataProvider>().appBackgroundColor_dp,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor:
                  context.watch<DataProvider>().appBackgroundColor_dp,
              automaticallyImplyLeading: false,
              forceElevated: (fromPage == 1) ? true : false,
              elevation: (fromPage == 1) ? 0.6 : 0,
              title: CustomTextView(
                textValue: appTitleText,
                textColor: context.watch<DataProvider>().appTextColor_dp,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              actions: [
                (fromPage == 1)
                    ? const SizedBox(
                        width: 0,
                        height: 0,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: CustomIconButtonSvg(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: closeSvg,
                              color: context
                                  .watch<DataProvider>()
                                  .appIconColorGray_dp,
                            ),
                          ),
                        ],
                      ),
              ],
              pinned: true,
              floating: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(74),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 30,
                    right: 30,
                    bottom: 5,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomTextView(
                            textValue: totalAssetText,
                            textColor: context
                                .watch<DataProvider>()
                                .appSubTextColorGray_dp,
                            fontSize: 15,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomTextView(
                            textValue: defaultAccount.getAccountBalance,
                            textColor: context
                                .watch<DataProvider>()
                                .appTextColorGray_dp,
                            fontSize: 32,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: SvgPicture.string(
                              shiftSvg,
                              height: 16,
                              width: 16,
                              colorFilter: ColorFilter.mode(
                                  appPrimaryColor, BlendMode.srcIn),
                            ),
                          ),
                          CustomTextView(
                            textValue: "+2%",
                            textColor: appPrimaryColor,
                            fontSize: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: (fromPage == 1) ? 0 : 25,
                width: 0,
              ),
            ),
            SliverToBoxAdapter(
              child: (fromPage == 1)
                  ? const SizedBox(
                      height: 0,
                      width: 0,
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              CustomTextView(
                                textValue: currentPlansText,
                                textColor: context
                                    .watch<DataProvider>()
                                    .appTextColor_dp,
                                fontSize: 22,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 170,
                            child: CustomPlanLargeCard(
                              onTap: () {},
                              bestPlan: bestPlan,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextView(
                                  textValue: seeAllPlansText,
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
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: CustomTextView(
                  textValue: historyText,
                  textColor: context.watch<DataProvider>().appTextColor_dp,
                  fontSize: 22,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 25,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: CustomTextView(
                                  textValue: transactions[index].getAmount,
                                  textColor: (transactions[index].isBuyOrSell)
                                      ? context
                                          .watch<DataProvider>()
                                          .appTextColor_dp
                                      : appPrimaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: deviceSize.width * 0.5,
                                alignment: Alignment.centerLeft,
                                child: CustomTextView(
                                  textValue: transactions[index].description,
                                  textColor: context
                                      .watch<DataProvider>()
                                      .appSubTextColorGray_dp,
                                  fontSize: 14,
                                  textMaxLine: 2,
                                ),
                              ),
                              Container(
                                width: (deviceSize.width * 0.5) - 60,
                                alignment: Alignment.centerRight,
                                child: CustomTextView(
                                  textValue: transactions[index].getDate,
                                  textColor: context
                                      .watch<DataProvider>()
                                      .appSubTextColorGray_dp,
                                  fontSize: 14,
                                  textMaxLine: 2,
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      )),
                ),
                childCount: transactions.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  onClosePressed(BuildContext context) {
    Navigator.of(context).pop();
  }
}
