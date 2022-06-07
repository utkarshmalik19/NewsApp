import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';
class ApiService{

  var endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=1f8501f90667436db7dbb698e9a06396";




  Future<List<Article>> getArticle() async{

    Response res = await get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      //this line will allow us to get the different articles from the json file and putting them into a list
      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}