import 'package:news_app/data/api/api_services.dart';
import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_sources/sources_datasource.dart';
import '../../models/category_model.dart';
import '../api/models/sources_response/source.dart';

class SourcesApiDataSource implements SourcesDataSource {
  APIServices apiServices;
  SourcesApiDataSource({required this.apiServices});
  @override
  Future<Result<List<Source>>> getSources(CategoryModel category) async {
    var result = await apiServices.getSources(category);
    return result;
  }
}