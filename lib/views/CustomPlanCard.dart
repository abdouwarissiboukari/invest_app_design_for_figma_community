import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/models/BestPlan.dart';
import 'package:invest_app/views/CustomTextView.dart';

class CustomPlanCard extends StatelessWidget {
  BestPlan bestPlan;

  CustomPlanCard({
    super.key,
    required this.bestPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Container(
            width: 134,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: bestPlan.planColors,
              ),
            ),
            child: Stack(
              children: [
                Transform.translate(
                  offset: const Offset(15, 12),
                  child: CustomTextView(
                    textValue: bestPlan.title,
                    textColor: appLightColorL,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(15, 30),
                  child: CustomTextView(
                    textValue: bestPlan.getDiscount,
                    textColor: appLightColorL,
                    fontSize: 14,
                  ),
                ),
                Transform.translate(
                  transformHitTests: false,
                  offset: const Offset(20, 42),
                  child: Image.asset(
                    bestPlan.getUrlImage,
                    width: 120,
                    height: 120,
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
