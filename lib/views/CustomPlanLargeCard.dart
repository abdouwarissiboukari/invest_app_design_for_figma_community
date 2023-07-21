import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/models/BestPlan.dart';
import 'package:invest_app/views/CustomTextView.dart';

class CustomPlanLargeCard extends StatelessWidget {
  BestPlan bestPlan;
  Function() onTap;

  CustomPlanLargeCard({
    super.key,
    required this.bestPlan,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          color: bestPlan.planColors[0],
          child: Container(
            width: 354,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: bestPlan.planColors,
                tileMode: TileMode.mirror,
              ),
            ),
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(30, 38),
                  child: CustomTextView(
                    textValue: bestPlan.title,
                    textColor: appDarkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(30, 60),
                  child: CustomTextView(
                    textValue: bestPlan.getDiscount,
                    textColor: appDarkColor,
                    fontSize: 15,
                  ),
                ),
                Transform.translate(
                  transformHitTests: false,
                  offset: const Offset(150, 12),
                  child: Image.asset(
                    bestPlan.getUrlImage,
                    width: 150,
                    height: 150,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
