class BankAccount {
  int id;
  String name;
  String accountNumber;
  String owner;
  String imageUrl;

  String get getImageUrl => "assets/$imageUrl";
  String get getDisplayName => "$name - ${accountNumber.substring(0, 6)}xxx";

  BankAccount({
    required this.id,
    required this.name,
    required this.accountNumber,
    required this.owner,
    required this.imageUrl,
  });
}
