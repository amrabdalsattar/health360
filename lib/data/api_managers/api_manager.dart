import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';

import '../responses/article_response.dart';

class ApiManager {

  static const String apiKey = "b27f46a1e4ac4bf09ef21f6fc7e5f83d";
  static const String baseUrl = "newsapi.org";
  static const String articlesEndpoint = "/v2/everything";

  static Future<List<Article>> getArticles() async {
    Uri url = Uri.https(
        baseUrl, articlesEndpoint,
        {"apiKey": apiKey, "sources": "medical-news-today"});
    var serverResponse = await get(url);
    Map json = jsonDecode(serverResponse.body);
    ArticleResponse articlesResponse = ArticleResponse.fromJson(json);
    if (serverResponse.statusCode >= 200 &&
        serverResponse.statusCode < 300 &&
        articlesResponse.articles?.isNotEmpty == true) {
      return articlesResponse.articles!;
    }
    throw Exception("Something Went Wrong, Please Try Again");
  }


}
