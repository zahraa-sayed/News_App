import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';

import '../../../data/api/models/article_response/Article.dart';


class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: ColorsManager.white, width: 2),
            ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(color: ColorsManager.white,),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            article.title ?? "",
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: ColorsManager.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  article.author ?? "",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: ColorsManager.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  article.publishedAt ?? "",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    color: ColorsManager.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
