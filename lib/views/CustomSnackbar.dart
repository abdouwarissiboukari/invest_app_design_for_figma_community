import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/data/AppColors.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';
import 'package:provider/provider.dart';

import '../services/DataProvider.dart';

SnackBar CustomSnackbar(
    {required String strTextValue, required BuildContext context}) {
  return SnackBar(
    backgroundColor: context.watch<DataProvider>().appTextColorGray_dp,
    content: CustomTitleTextView(
      textValue: strTextValue,
      textColor: context.watch<DataProvider>().appBackgroundColor_dp,
    ),
  );
}
