import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_app/views/CustomTitleTextView.dart';
import 'package:provider/provider.dart';

import '../services/DataProvider.dart';

SnackBar CustomSnackbar(
    {required String strTextValue, required BuildContext context}) {
  return SnackBar(
    backgroundColor:
        Provider.of<DataProvider>(context, listen: false).appTextColorGray_dp,
    content: CustomTitleTextView(
      textValue: strTextValue,
      textColor: Provider.of<DataProvider>(context, listen: false)
          .appBackgroundColor_dp,
    ),
  );
}
