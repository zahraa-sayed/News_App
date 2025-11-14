import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/api/api_services.dart';
import 'package:news_app/api/models/article_response/Article.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/features/home/sources_view/article.dart';
import 'package:news_app/features/home/sources_view/articles_provider.dart';
import 'package:news_app/features/home/sources_view/sources_provider.dart';
import 'package:news_app/models/category_model.dart';
import 'package:provider/provider.dart';

import '../../../api/models/sources_response/source.dart';

class SourcesView extends StatefulWidget {
  const SourcesView({super.key, required this.category});

  final CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesProvider sourcesProvider;
  late ArticlesProvider articlesProvider;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    sourcesProvider = SourcesProvider();
    articlesProvider = ArticlesProvider();
    await sourcesProvider.fetchSources(widget.category);
    articlesProvider.fetchArticles(sourcesProvider.sources[0]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesProvider),
        ChangeNotifierProvider.value(value: articlesProvider),
      ],
      child: Column(
        children: [
          Consumer<SourcesProvider>(
            builder: (context, sourcesProvider, child) {
              if (sourcesProvider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (sourcesProvider.errorMessage != null) {
                return Center(
                  child: Text(
                    sourcesProvider.errorMessage!,
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                  ),
                );
              }
              return DefaultTabController(
                length: sourcesProvider.sources.length,
                child: TabBar(
                  onTap: (index) {
                    articlesProvider.fetchArticles(
                      sourcesProvider.sources[index],
                    );
                  },
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: ColorsManager.white,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                  unselectedLabelStyle: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorsManager.white,
                  ),
                  tabs: sourcesProvider.sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
              );
            },
          ),
          Consumer<ArticlesProvider>(
            builder: (context, articlesProvider, child) {
              if (articlesProvider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (articlesProvider.errorMessage != null) {
                return Center(
                  child: Text(
                    articlesProvider.errorMessage!,
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      color: ColorsManager.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }
              List<Article> articles = articlesProvider.articles;
              return Expanded(
                child: ListView.separated(
                        itemBuilder: (context, index) => ArticleItem(
                          article: articles[index],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16.h),
                        itemCount: articles.length,
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
