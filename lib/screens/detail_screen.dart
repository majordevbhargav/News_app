import 'package:flutter/material.dart';
import '../models/article_model.dart';

class DetailScreen extends StatelessWidget {

  final Article article;

  DetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          Image.network(
            article.imageUrl,
            height: 350,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          Positioned(
            top: 300,
            child: Container(
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(article.title,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),

                  SizedBox(height: 10),

                  Text("${article.source} • ${article.date}"),

                  SizedBox(height: 20),

                  Text(article.description),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}