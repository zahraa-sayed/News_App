import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_app/data/api/result.dart';

import 'package:news_app/models/category_model.dart';
import 'package:http/http.dart' as http;

import 'models/article_response/Article.dart';
import 'models/article_response/ArticlesResponse.dart';
import 'models/sources_response/SourcesResponse.dart';
import 'models/sources_response/source.dart';

class APIServices{
  static const String baseURL = "newsapi.org";
  static const String APIKey = "bd29696213ca4173b42b4ed9bda5abab";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";

  Future<Result<List<Source>>> getSources(CategoryModel category) async {
    try {
      Uri url = Uri.https(baseURL, sourcesEndPoint, {
        "apiKey": APIKey,
        "category": category.id,
      });
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == "error") {
        return ServerError(message: sourcesResponse.message ?? "");
      } else {
        return Success(data: sourcesResponse.sources ?? []);
      }
    }catch(exception){
      return Error(exception: exception.toString());
    }
  }

  Future<Result<List<Article>>> getArticle(Source source) async{
    try {
      var url = Uri.https(baseURL, articlesEndPoint, {
        "apiKey": APIKey,
        "sources": source.id,
      });
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if (articlesResponse.status == "error") {
        return ServerError(message: articlesResponse.message ?? "");
      } else {
        return Success(data: articlesResponse.articles ?? []);
      }
    }catch(exception){
      return Error(exception: exception.toString());
    }
  }
}


//https://newsapi.org/v2/everything?q=bitcoin&apiKey=bd29696213ca4173b42b4ed9bda5abab
//bd29696213ca4173b42b4ed9bda5abab
