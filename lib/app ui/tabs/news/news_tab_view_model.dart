import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app%20logic/api/api_manager/api_manager.dart';

import '../../../app logic/api/models/newsResponse.dart';

class NewsTabViewModel extends Cubit<NewsState> {
  NewsTabViewModel() : super(LoadingState("Loading....."));

  void getNews(String sourceId)async {
    emit(LoadingState("Loading...."));
    try {
      var response = await ApiManager.getNewsWithId(sourceId);
      if(response.status=='error'){
        emit(ErrorState(response.message));
      }
      else
        {
          emit(SuccessState(response.articles??[]));
        }
    } catch (e) {
      ErrorState(e.toString());
    }
  }
}

sealed class NewsState {}

class LoadingState extends NewsState {
  String? message;

  LoadingState(this.message);
}

class SuccessState extends NewsState {
  List<News> newsList;

  SuccessState(this.newsList);
}

class ErrorState extends NewsState {
  String? message;

  ErrorState(this.message);
}
