class Article {
  String author ;
  String title;
  String content;
  String urlToImage;
  String publishedAt;

  Article({
    required this.title,
    required this.author,
    required this.urlToImage,
    required this.content,
    required this.publishedAt
  });

  factory Article.fromJson(Map<String , dynamic> json) => Article(
    title:  json["title"]  ?? "Null",
    author: json["author"] ?? "Null",
    urlToImage: json["urlToImage"] ?? "https://www.btklsby.go.id/images/placeholder/basic.png"  ,
    content: json["content"] ?? "Null",
    publishedAt: json["publishedAt"] ?? "Null",
  );
}