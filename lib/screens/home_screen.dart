import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/article_model.dart';
import '../widgets/news_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<Article>> news;

  @override
  void initState() {
    super.initState();
    news = ApiService.fetchNews();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("HEADLINES"),
        centerTitle: true,
      ),

      body: FutureBuilder<List<Article>>(

        future: news,

        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final articles = snapshot.data!;

          return ListView.builder(
            itemCount: articles.length,

            itemBuilder: (context, index) {

              return NewsCard(

                article: articles[index],

                onTap: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          DetailScreen(article: articles[index]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}