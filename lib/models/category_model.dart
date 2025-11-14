import 'dart:ui';

import 'package:news_app/core/assets_manager.dart';

class CategoryModel {
  String id;
  String title;
  String imagePath;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  static List<CategoryModel> categories = [
    CategoryModel(id: "general", title: "General", imagePath: ImageAssets.generalBlack),
    CategoryModel(id: "sports", title: "Sports", imagePath: ImageAssets.sportBlack),
    CategoryModel(id: "entertainment", title: "Entertainment", imagePath: ImageAssets.entertainmentBlack),
    CategoryModel(id: "health", title: "Health", imagePath: ImageAssets.healthBlack),
    CategoryModel(id: "science", title: "Science", imagePath: ImageAssets.scienceBlack),
    CategoryModel(id: "technology", title: "Technology", imagePath: ImageAssets.technologyBlack),
    CategoryModel(id: "business", title: "Business", imagePath: ImageAssets.businessBlack),
  ];
}
