import 'package:news_app/data/api/result.dart';
import 'package:news_app/data/data_sources/sources_datasource.dart';
import 'package:news_app/repositories/sources_repository.dart';
import '../../models/category_model.dart';
import '../api/models/sources_response/source.dart';

class SourcesRepositoryImpl implements SourcesRepository{
  SourcesDataSource sourcesDataSource;
  SourcesRepositoryImpl({required this.sourcesDataSource});
  @override
  Future<Result<List<Source>>> getSources(CategoryModel category)async {
    var result = await sourcesDataSource.getSources(category);
    return result;
  }
}