import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import '../../model/NewsResponse.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget{
  final News news;
  const NewsItem({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width*0.02,
        vertical: height*0.02,
      ),
      margin: EdgeInsets.symmetric(
          horizontal: width*0.04
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).splashColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.grayColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(height: height*0.02,),
          Text(news.title??'',
            style: Theme.of(context).textTheme.labelLarge,),
          SizedBox(height: height*0.02,),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'By: ${news.author??''}',
                  style: AppStyles.medium12Gray,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Text(
                news.publishedAt ?? '',
                style: AppStyles.medium12Gray,
              ),
            ],
          ),
        ],
      ),
    );
  }
}