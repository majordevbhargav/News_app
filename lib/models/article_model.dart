class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String source;
  final String date;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.source,
    required this.date,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      source: json['source']['name'] ?? '',
      date: json['publishedAt'] ?? '',
    );
  }
}