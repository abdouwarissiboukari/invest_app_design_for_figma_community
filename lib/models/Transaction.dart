import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:invest_app/data/DoubleFormatExt.dart';

class Transaction {
  int id;
  double amount;
  String description;
  DateTime date;
  bool isBuyOrSell;

  String get getAmount => amount.toDoubleFormatsRP();
  String get getDate => DateFormat.yMMMEd().format(date);

  Transaction({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
    this.isBuyOrSell = true,
  });
}
