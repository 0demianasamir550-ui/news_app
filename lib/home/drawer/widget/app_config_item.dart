import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppConfigItem extends StatelessWidget {
  final String name;
  const AppConfigItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width*0.04
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width*0.03,
        vertical: height*0.01
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: AppStyles.medium20White,
          ),
          Icon(
            Icons.arrow_drop_down_outlined,
            size: 35,
            color: AppColors.whiteColor,
          ),
        ],
      ),
    );
  }
}