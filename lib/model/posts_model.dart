class PostModel {
  int userId;
  int id;
  String title;
  String completed;
  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        userId: json["userId"]!,
        id: json["id"]!,
        title: json["title"]!,
        completed: json["completed"]!);
  }
}
