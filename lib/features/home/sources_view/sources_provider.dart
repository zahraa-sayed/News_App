import 'package:flutter/material.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/api/models/sources_response/SourcesResponse.dart';
import 'package:news_app/api/models/sources_response/source.dart';
import 'package:news_app/models/category_model.dart';

class SourcesProvider extends ChangeNotifier{
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchSources(CategoryModel category)async {
    isLoading = true;
    notifyListeners();
    var result = await APIServices.getSources(category);
    isLoading = false;
    notifyListeners();
    result.fold((message){
      errorMessage = message;
      notifyListeners();
    }, (sourcesList){
      sources = sourcesList;
      notifyListeners();
    });
  }
}