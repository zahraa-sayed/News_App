import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class SourcesView extends StatelessWidget {
  const SourcesView({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(category.title),
    );
  }
}
