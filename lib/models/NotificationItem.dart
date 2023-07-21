class NotificationItem {
  int id;
  String description;
  String timeAgo;
  String imageUrl;

  String get getImageUrl => "assets/$imageUrl";

  NotificationItem({
    required this.id,
    required this.description,
    required this.timeAgo,
    required this.imageUrl,
  });
}
