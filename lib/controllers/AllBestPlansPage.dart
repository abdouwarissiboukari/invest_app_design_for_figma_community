import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/controllers/MyAsset.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomPlanLargeCard.dart';
import 'package:invest_app/views/CustomSearchInput.dart';
import 'package:invest_app/views/CustomSearchResultCard.dart';
import 'package:invest_app/views/CustomTextView.dart';
import 'package:provider/provider.dart';

import '../data/SvgData.dart';
import '../services/DataProvider.dart';
import '../views/CustomIconButtonSvg.dart';

class AllBestPlansPage extends StatefulWidget {
  @override
  AllBestPlansPageState createState() => AllBestPlansPageState();
}

class AllBestPlansPageState extends State<AllBestPlansPage> {
  late TextEditingController controller;
  final appTitleText = "All Best Plans";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.watch<DataProvider>().appBackgroundColor_dp,
      child: SafeArea(
        child: Hero(
          tag: 'All plans',
          transitionOnUserGestures: true,
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor:
                        context.watch<DataProvider>().appBackgroundColor_dp,
                    automaticallyImplyLeading: false,
                    title: CustomTextView(
                      textValue: appTitleText,
                      textColor: context.watch<DataProvider>().appTextColor_dp,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    actions: [
                      Row(
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
                      preferredSize: const Size.fromHeight(64),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 35,
                          right: 35,
                          bottom: 5,
                        ),
                        child: CustomSearchInput(
                          controller: controller,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 7,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => Container(
                              height: 170,
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: CustomPlanLargeCard(
                                  onTap: () {
                                    closeKeybord();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext btx) => MyAsset(
                                          bestPlan: context
                                              .watch<DataProvider>()
                                              .bestPlans_dp[index],
                                          fromPage: 0,
                                        ),
                                      ),
                                    );
                                  },
                                  bestPlan: context
                                      .watch<DataProvider>()
                                      .bestPlans_dp[index]),
                            ),
                        childCount:
                            context.watch<DataProvider>().bestPlans_dp.length),
                  ),
                ],
              ),
              (context.watch<DataProvider>().isFilled_dp)
                  ? Transform.translate(
                      offset: const Offset(0, 118),
                      child: Container(
                        decoration: BoxDecoration(
                          color: context
                              .watch<DataProvider>()
                              .appBackgroundColor_dp,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        margin: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                        ),
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: (Provider.of<DataProvider>(context,
                                          listen: false)
                                      .bestPlansSearchResult_dp
                                      .isNotEmpty)
                                  ? CustomSearchResultCard(
                                      onTap: () => onSearchResultItemTaped(
                                        Provider.of<DataProvider>(context,
                                                listen: false)
                                            .bestPlansSearchResult_dp[0]
                                            .title,
                                      ),
                                      topLeft: 30,
                                      topRight: 30,
                                      textValue: context
                                          .watch<DataProvider>()
                                          .bestPlansSearchResult_dp[0]
                                          .title,
                                      iconColor: context
                                          .watch<DataProvider>()
                                          .appIconColorGray_dp,
                                      iconLeft: Icons.search,
                                      iconRight: Icons.arrow_back,
                                    )
                                  : CustomSearchResultCard(
                                      onTap: () {},
                                      topLeft: 30,
                                      topRight: 30,
                                      bottomLeft: 30,
                                      bottomRight: 30,
                                      textValue: "No result found",
                                      iconColor: context
                                          .watch<DataProvider>()
                                          .appIconColorGray_dp,
                                      iconLeft: Icons.search,
                                      iconRight: Icons.arrow_back,
                                    ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                childCount: context
                                    .watch<DataProvider>()
                                    .bestPlansSearchResult_dp
                                    .length,
                                (context, index) => (index > 0 &&
                                        index <
                                            context
                                                    .watch<DataProvider>()
                                                    .bestPlansSearchResult_dp
                                                    .length -
                                                1)
                                    ? CustomSearchResultCard(
                                        onTap: () => onSearchResultItemTaped(
                                          Provider.of<DataProvider>(context,
                                                  listen: false)
                                              .bestPlansSearchResult_dp[index]
                                              .title,
                                        ),
                                        topLeft: 0,
                                        topRight: 0,
                                        textValue: context
                                            .watch<DataProvider>()
                                            .bestPlansSearchResult_dp[index]
                                            .title,
                                        iconColor: context
                                            .watch<DataProvider>()
                                            .appIconColorGray_dp,
                                        iconLeft: Icons.search,
                                        iconRight: Icons.arrow_back,
                                      )
                                    : const SizedBox(
                                        height: 0,
                                        width: 0,
                                      ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: (Provider.of<DataProvider>(context,
                                              listen: false)
                                          .bestPlansSearchResult_dp
                                          .length >
                                      1)
                                  ? CustomSearchResultCard(
                                      onTap: () => onSearchResultItemTaped(
                                        Provider.of<DataProvider>(context,
                                                listen: false)
                                            .bestPlansSearchResult_dp[context
                                                    .watch<DataProvider>()
                                                    .bestPlansSearchResult_dp
                                                    .length -
                                                1]
                                            .title,
                                      ),
                                      topLeft: 0,
                                      topRight: 0,
                                      bottomLeft: 30,
                                      bottomRight: 30,
                                      textValue: context
                                          .watch<DataProvider>()
                                          .bestPlansSearchResult_dp[context
                                                  .watch<DataProvider>()
                                                  .bestPlansSearchResult_dp
                                                  .length -
                                              1]
                                          .title,
                                      iconColor: context
                                          .watch<DataProvider>()
                                          .appIconColorGray_dp,
                                      iconLeft: Icons.search,
                                      iconRight: Icons.arrow_back,
                                    )
                                  : const SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  onClosePressed() {
    Navigator.of(context).pop();
  }

  closeKeybord() => FocusScope.of(context).requestFocus(FocusNode());

  onTap() {
    closeKeybord();
  }

  onSearchResultItemTaped(String value) {
    closeKeybord();
    context.read<DataProvider>().searchPlans(value);
    context.read<DataProvider>().setIsSearchFilled(false);
  }
}
