import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:news_app/api/models/article_response/Article.dart';
import 'package:news_app/api/models/article_response/ArticlesResponse.dart';
import 'package:news_app/api/models/sources_response/SourcesResponse.dart';
import 'package:news_app/api/models/sources_response/source.dart';
import 'package:news_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class APIServices{
  static const String baseURL = "newsapi.org";
  static const String APIKey = "bd29696213ca4173b42b4ed9bda5abab";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";

  static Future<Either<String, List<Source>>> getSources(CategoryModel category) async {
    Uri url = Uri.https(
      baseURL,
      sourcesEndPoint,
      {
        "apiKey": APIKey,
        "category": category.id,
      }
    );
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if(sourcesResponse.status == "error"){
      return left(sourcesResponse.message ?? "");
    }else{
      return right(sourcesResponse.sources ?? []);
    }
  }

  static Future<Either<String, List<Article>>> getArticle(Source source) async{
    var url = Uri.https(baseURL, articlesEndPoint,{
      "apiKey": APIKey,
      "sources": source.id,
    });
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    if(articlesResponse.status == "error"){
      return left(articlesResponse.message ?? "");
    }else{
      return right(articlesResponse.articles ?? []);
    }
  }

}


//https://newsapi.org/v2/everything?q=bitcoin&apiKey=bd29696213ca4173b42b4ed9bda5abab
//bd29696213ca4173b42b4ed9bda5abab
