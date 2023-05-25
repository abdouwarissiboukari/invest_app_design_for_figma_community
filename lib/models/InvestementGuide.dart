class InvestementGuide {
  int id;
  String title;
  String description;
  String imageUrl;

  String get getUrlImage => "assets/$imageUrl";

  InvestementGuide({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
