import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/repositories/sources_repository.dart';

import '../../../data/api/api_services.dart';
import '../../../data/api/models/sources_response/source.dart';
import '../../../data/api/result.dart';

class SourcesViewModel extends ChangeNotifier{
  SourcesRepository sourcesRepository;
  SourcesViewModel({required this.sourcesRepository});
  List<Source> sources = [];
  bool isLoading = false;
  String? errorMessage;
  Future<void> fetchSources(CategoryModel category)async {
    isLoading = true;
    notifyListeners();
    var result = await sourcesRepository.getSources(category);
    isLoading = false;
    notifyListeners();
    switch(result){
      case Success(): {
        sources = result.data;
      }
      case ServerError(): {
        errorMessage = result.message;
      }
      case Error(): {
        errorMessage = result.exception;
      }
      notifyListeners();
    }
  }
}