import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/DefaultData.dart';
import 'package:invest_app/models/BankAccount.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:invest_app/views/CustomScaffoldFloatingButton.dart';
import 'package:provider/provider.dart';

import '../data/AppColors.dart';
import '../data/SvgData.dart';
import '../main.dart';
import '../services/DataProvider.dart';
import '../views/CustomIconButtonSvg.dart';
import '../views/CustomTextView.dart';

class BankAccountInfoPage extends StatelessWidget {
  List<BankAccount> bankacounts = DefaultData().allBankAccount();
  final bankAccountInfoText = "Bank account info";
  final strButtonTex = "Add account";

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldFloatingButton(
      appTitleText: bankAccountInfoText,
      leadingIcon: CustomIconButtonSvg(
        onPressed: () => Navigator.pop(context),
        icon: backArrowSvg,
        color: context.watch<DataProvider>().appTextColor_dp,
      ),
      trailingIcon: (blOsType)
          ? CustomIconButton(
              onPressed: () {},
              icon: Icons.add,
              color: context.watch<DataProvider>().appTextColor_dp,
            )
          : const SizedBox(
              width: 0,
              height: 0,
            ),
      floatingIcon: const Icon(Icons.add),
      floatingLabel: CustomTextView(
        textValue: strButtonTex,
        textColor: appButtonTextColor,
        fontSize: 17,
      ),
      floatingBackgroundColor: appPrimaryColor,
      floatingOnPressed: () {
        if (Provider.of<DataProvider>(context, listen: false)
            .isExtended_bankAccountPage) {
          context.read<DataProvider>().setIsExtendedBankAccountPage(false);
        } else {
          context.read<DataProvider>().setIsExtendedBankAccountPage(true);
        }
      },
      bodyWidget: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
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
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Card(
                        elevation: 0.2,
                        color:
                            context.watch<DataProvider>().appBackgroundColor_dp,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        bankacounts[index].getImageUrl),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: deviceSize.width * 0.55,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: CustomTextView(
                                            textValue: bankacounts[index]
                                                .getDisplayName,
                                            textColor: context
                                                .watch<DataProvider>()
                                                .appTextColor_dp,
                                            fontSize: 15,
                                            textMaxLine: 1,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: CustomTextView(
                                            textValue: bankacounts[index].owner,
                                            textColor: context
                                                .watch<DataProvider>()
                                                .appTextColor_dp,
                                            fontSize: 12,
                                            textMaxLine: 1,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(20, -20),
                                child: CustomIconButton(
                                  onPressed: () {},
                                  icon: Icons.more_vert,
                                  color: context
                                      .watch<DataProvider>()
                                      .appTextColor_dp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  childCount: bankacounts.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
