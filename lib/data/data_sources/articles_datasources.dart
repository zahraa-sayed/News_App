import 'package:news_app/data/api/models/article_response/Article.dart';
import 'package:news_app/data/api/models/sources_response/source.dart';
import 'package:news_app/data/api/result.dart';

abstract class ArticlesDataSource{
  Future<Result<List<Article>>> getArticles(Source source);
}