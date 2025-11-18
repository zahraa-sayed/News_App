import 'package:news_app/data/data_sources/articles_datasources.dart';
import 'package:news_app/repositories/articles_repository.dart';
import '../api/models/article_response/Article.dart';
import '../api/models/sources_response/source.dart';
import '../api/result.dart';

class ArticlesRepositoryImpl implements ArticlesRepository{
  ArticlesDataSource articlesDataSource;
  ArticlesRepositoryImpl({required this.articlesDataSource});
  @override
  Future<Result<List<Article>>> getArticles(Source source) {
    return articlesDataSource.getArticles(source);
  }
}