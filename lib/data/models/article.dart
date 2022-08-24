class ArticleResponse {
  ArticleResponse({
    required this.data,
  });

  List<Article> data;

  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      ArticleResponse(
        data: List<Article>.from(json["data"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        userId: json["id"],
        id: json["id"],
        title: json["title"],
        body: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "description": body,
      };
}
