import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/DefaultData.dart';
import 'package:invest_app/data/SvgData.dart';
import 'package:invest_app/models/NotificationItem.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomIconButtonSvg.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../views/CustomScaffold.dart';
import '../views/CustomTextView.dart';

class NotificationPage extends StatelessWidget {
  List<NotificationItem> notificationItems = DefaultData().allNotification();
  final String notificationTitleTex = "Notification";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        leadingIcon: CustomIconButtonSvg(
          onPressed: () => Navigator.pop(context),
          icon: backArrowSvg,
          color: context.watch<DataProvider>().appTextColor_dp,
        ),
        trailingIcon: const SizedBox(
          width: 0,
          height: 0,
        ),
        bodyWidget: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: CustomTextView(
                      textValue: notificationTitleTex,
                      textColor: context.watch<DataProvider>().appTextColor_dp,
                      fontSize: 34,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            notificationItems[index]
                                                .getImageUrl),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: deviceSize.width * 0.45,
                                    alignment: Alignment.centerLeft,
                                    child: CustomTextView(
                                      textValue:
                                          notificationItems[index].description,
                                      textColor: context
                                          .watch<DataProvider>()
                                          .appTextColor_dp,
                                      fontSize: 14,
                                      textMaxLine: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 70,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width:
                                              (deviceSize.width * 0.55) - 140,
                                          alignment: Alignment.centerRight,
                                          child: CustomTextView(
                                            textValue: notificationItems[index]
                                                .timeAgo,
                                            textColor: context
                                                .watch<DataProvider>()
                                                .appSubTextColorGray_dp,
                                            fontSize: 10,
                                            textMaxLine: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 5,
                              ),
                            ],
                          )),
                    ),
                    childCount: notificationItems.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
