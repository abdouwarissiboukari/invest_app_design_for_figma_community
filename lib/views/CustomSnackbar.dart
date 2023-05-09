import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';

SnackBar CustomSnackbar({required String strTextValue}) {
  return SnackBar(
    backgroundColor: appTextColorGray,
    content: CustomTitleTextView(
      textValue: strTextValue,
      textColor: appBackgroundColor,
    ),
  );
}
