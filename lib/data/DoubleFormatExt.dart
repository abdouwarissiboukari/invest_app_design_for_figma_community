import 'package:intl/intl.dart';

extension DoubleExt on double {
  String toDoubleFormatsN() {
    return NumberFormat.simpleCurrency(name: "N", decimalDigits: 0)
        .format(this);
  }

  String toDoubleFormatsRP() {
    return NumberFormat.simpleCurrency(name: "Rp ", decimalDigits: 0)
        .format(this);
  }
}
