import 'package:invest_app/data/DoubleFormatExt.dart';

class Account {
  int userId;
  String accountNumber;
  String accountName;
  double accountBalance;

  String get getAccountBalance => accountBalance.toDoubleFormatsN();

  Account({
    required this.userId,
    required this.accountNumber,
    required this.accountName,
    required this.accountBalance,
  });
}
