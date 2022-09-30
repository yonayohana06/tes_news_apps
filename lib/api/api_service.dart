import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List<Article> news = [];

  Future<void> getArticle() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d0e7a7e572324c8293d60acd19473f3c";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }

      });
    }
  }
}
