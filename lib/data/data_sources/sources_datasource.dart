import 'package:news_app/data/api/models/sources_response/source.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/models/category_model.dart';

abstract class SourcesDataSource{
  Future<Result<List<Source>>> getSources(CategoryModel category);
}