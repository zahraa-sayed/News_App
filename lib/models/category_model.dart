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
    CategoryModel(id: "id", title: "General", imagePath: ImageAssets.generalBlack),
    CategoryModel(id: "id", title: "Sports", imagePath: ImageAssets.sportBlack),
    CategoryModel(id: "id", title: "Entertainment", imagePath: ImageAssets.entertainmentBlack),
    CategoryModel(id: "id", title: "Health", imagePath: ImageAssets.healthBlack),
    CategoryModel(id: "id", title: "Science", imagePath: ImageAssets.scienceBlack),
    CategoryModel(id: "id", title: "Technology", imagePath: ImageAssets.technologyBlack),
    CategoryModel(id: "id", title: "Business", imagePath: ImageAssets.businessBlack),
  ];
}
