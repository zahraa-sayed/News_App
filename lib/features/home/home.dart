import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/features/home/categories_view/categories_view.dart';
import 'package:news_app/features/home/categories_view/category_item.dart';
import 'package:news_app/features/home/home_drawer/home_drawer.dart';
import 'package:news_app/features/home/sources_view/sources_view.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(homeProvider.title)),
      body: homeProvider.homeView,
      drawer: HomeDrawer(),
    );
  }

  // void goToHome() {
  //   homeView = CategoriesView();
  //   Navigator.pop(context);
  //   setState(() {});
  // }
  //
  // void onCategoryItemClicked(CategoryModel selectedCategory) {
  //   homeView = SourcesView(category: selectedCategory);
  //   title = selectedCategory.title;
  //   setState(() {});
  // }
}
