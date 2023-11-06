import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/app%20logic/api/api_constant.dart';
import 'package:news_app/app%20logic/api/models/newsResponse.dart';

import '../models/sourceResponse.dart';
class ApiManager {


  static Future<Source> getSources(String category) async{
    //https://newsapi.org/v2/top-headlines/sources?apiKey=588c9cbcbae04410a606bf33e868c866
    Uri url =  Uri.https(ApiConstant.baseUrl,ApiConstant.sourceApi,{
      'apiKey':'588c9cbcbae04410a606bf33e868c866',
      'category': category
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return Source.fromJson(json);
    } catch(e)
    {
      throw(e);
    }
  }

  static Future<NewsResponse> getNewsWithId(String sourceId,{String? search}) async{
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=588c9cbcbae04410a606bf33e868c866
    Uri url = Uri.https(ApiConstant.baseUrl,ApiConstant.newsApi,{
      'apiKey': '588c9cbcbae04410a606bf33e868c866',
      'sources':sourceId,
      'q':search
    });
    try
    {
      var response = await http.get(url);
      var bodyString = response.body;
      var json  = jsonDecode(bodyString);
      return NewsResponse.fromJson(json);
    } catch(e)
    {
      throw e;
    }




  }
}