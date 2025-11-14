import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/api/models/article_response/Article.dart';
import 'package:news_app/api/models/article_response/ArticlesResponse.dart';
import 'package:news_app/api/models/sources_response/source.dart';

class ArticlesProvider extends ChangeNotifier{
  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;
  void fetchArticles(Source source)async{
    isLoading = true;
    notifyListeners();
    var result = await APIServices.getArticle(source);
    isLoading = false;
    notifyListeners();
    result.fold((error){
      errorMessage = error;
      notifyListeners();
    }, (articlesList){
      articles = articlesList;
      notifyListeners();
    });
  }
}