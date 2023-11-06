import 'package:flutter/material.dart';
import 'package:news_app/app%20logic/api/api_manager/api_manager.dart';

import '../../../app logic/api/models/newsResponse.dart';

class NewsViewModel extends ChangeNotifier {
  bool? loading;
  List<News>? newsList;
  String? errorMessage;

  void getNews(String sourceId) async {
    loading = true;
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsWithId(sourceId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        newsList = response.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
