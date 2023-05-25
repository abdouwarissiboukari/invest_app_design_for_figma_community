import 'dart:io';

import 'package:intl/intl.dart';

extension DoubleExt on double {
  String toDOubleFormats() {
    return NumberFormat.simpleCurrency(name: "N", decimalDigits: 0)
        .format(this);
  }
}
