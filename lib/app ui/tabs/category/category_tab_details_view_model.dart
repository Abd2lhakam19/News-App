import 'package:flutter/material.dart';
import 'package:news_app/app%20logic/api/api_manager/api_manager.dart';

import '../../../app logic/api/models/sourceResponse.dart';

class CategoryTabViewModel extends ChangeNotifier {
  List<Sources>? sources;
  String? errorMessage;
  bool? loading;

 void getSources(String? categoryId) async {
    loading = true;
    errorMessage = null;
    sources = null;
    notifyListeners();
    try {
      loading = false;
      var response = await ApiManager.getSources(categoryId??"");
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sources = response.sources;
      }
    } catch (e) {
      loading = false;
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
