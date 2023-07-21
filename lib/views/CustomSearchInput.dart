import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/services/DataProvider.dart';
import 'package:invest_app/views/CustomIconButton.dart';
import 'package:provider/provider.dart';

class CustomSearchInput extends StatelessWidget {
  TextEditingController controller;

  CustomSearchInput({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextField(
        onChanged: (value) => onChangedText(value, context),
        controller: controller,
        cursorColor: appPrimaryColor,
        decoration: InputDecoration(
          fillColor: appBackgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          prefixIcon: Icon(
            Icons.search_outlined,
            color: context.watch<DataProvider>().appIconColorGray_dp,
          ),
          suffixIcon: (context.watch<DataProvider>().isFilled_dp)
              ? CustomIconButton(
                  onPressed: () {
                    controller.clear();
                    context.read<DataProvider>().setIsSearchFilled(false);
                  },
                  icon: Icons.close,
                  color: context.watch<DataProvider>().appIconColorGray_dp)
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
          hintText: "Search plan",
          hintStyle: TextStyle(
            fontSize: 14,
            color: context.watch<DataProvider>().appTextColorGray_dp,
          ),
        ),
      ),
    );
  }

  onChangedText(String value, BuildContext context) {
    final isValue =
        Provider.of<DataProvider>(context, listen: false).isFilled_dp;
    if (controller.text.isNotEmpty) {
      if (!isValue) context.read<DataProvider>().setIsSearchFilled(true);

      context.read<DataProvider>().searchPlanResult(controller.text);
    } else {
      if (isValue) context.read<DataProvider>().setIsSearchFilled(false);
      context.read<DataProvider>().searchPlanResult(controller.text);
    }
  }
}
