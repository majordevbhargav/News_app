import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';

class ApiService {

  static const apiKey = "b8509086f6604681a666dfa058dec951";

  static Future<List<Article>> fetchNews() async {

    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey"
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {

      final data = jsonDecode(response.body);
      List articles = data['articles'];

      return articles
          .map((article) => Article.fromJson(article))
          .toList();
    } else {
      throw Exception("Failed to load news");
    }
  }
}