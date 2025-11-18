import 'package:news_app/data/api/api_services.dart';
import 'package:news_app/data/api/models/sources_response/source.dart';
import 'package:news_app/data/data_sources/articles_datasources.dart';
import '../../models/category_model.dart';
import '../api/models/article_response/Article.dart';
import '../api/result.dart';

class ArticlesApiDataSource implements ArticlesDataSource{
  APIServices apiServices;
  ArticlesApiDataSource({required this.apiServices});
  @override
  Future<Result<List<Article>>> getArticles(Source source) {
    return apiServices.getArticle(source);
  }
}