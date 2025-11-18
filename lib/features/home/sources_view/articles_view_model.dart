import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_services.dart';
import 'package:news_app/data/api/models/article_response/Article.dart';
import 'package:news_app/data/api/models/sources_response/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/repositories/articles_repository.dart';

class ArticlesViewModel extends ChangeNotifier{
  ArticlesRepository articlesRepository;
  ArticlesViewModel({required this.articlesRepository});
  List<Article> articles = [];
  bool isLoading = false;
  String? errorMessage;
  void fetchArticles(Source source)async{
    isLoading = true;
    notifyListeners();
    var result = await articlesRepository.getArticles(source);
    isLoading = false;
    notifyListeners();
    switch(result){
      case Success(): {
        articles = result.data;
      }
      case ServerError(): {
        errorMessage = result.message;
      }
      case Error(): {
        errorMessage = result.exception;
      }
    }
    notifyListeners();
  }
}