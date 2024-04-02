import 'package:flutter/material.dart';
import 'package:health360/data/api_managers/api_manager.dart';

import '../../data/responses/article_response.dart';

class NewsViewModel extends ChangeNotifier {
  List<Article> articles = [];
  bool isLoading = false;
  String? errorText;

  void getSources() async {
    isLoading = true;
    notifyListeners();
    try {
      articles = await ApiManager.getArticles();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorText = e.toString();
      notifyListeners();
    }
  }
}
