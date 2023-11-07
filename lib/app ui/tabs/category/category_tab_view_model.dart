import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app%20logic/api/api_manager/api_manager.dart';

import '../../../app logic/api/models/sourceResponse.dart';

class CategoryTabViewModel extends Cubit<CategoryState>{
  CategoryTabViewModel():super(LoadingState("Loading....."));

  void getSources(String categoryId) async
  {
    emit(LoadingState("Loading......"));
    try{
      var response = await ApiManager.getSources(categoryId);
      if(response.status=='error'){
        emit(ErrorState(response.message));
      }else
        {
          emit(SuccessState(response.sources??[]));
        }
    }catch(e){

    }
  }
}

sealed class CategoryState{}
class LoadingState extends CategoryState{
  String?message;
  LoadingState(this.message);
}

class SuccessState extends CategoryState{
  List<Sources> sourcesList;
  SuccessState(this.sourcesList);
}
class ErrorState extends CategoryState{
  String?message;
  ErrorState(this.message);
}
