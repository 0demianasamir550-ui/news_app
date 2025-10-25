import 'package:news_app/home/drawer/widget/app_config_item.dart';
import 'package:news_app/home/drawer/widget/divider_item.dart';
import 'package:news_app/home/drawer/widget/drawer_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/assets_manager.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onDrawerItemClick;
  const HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: height * 0.20,
          alignment: Alignment.center,
          color: AppColors.whiteColor,
          child: Text(
            'News App',
            style: AppStyles.bold24Black,
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerItemClick();
          },
          child: const DrawerItem(
            iconName: AssetsManager.homeIcon,
            text: 'Go To Home',
          ),
        ),
        const DividerItem(),
        const DrawerItem(
          iconName: AssetsManager.themeIcon,
          text: 'Theme',
        ),
        const AppConfigItem(name: 'Dark'),
        SizedBox(height: height * 0.02),
        const DividerItem(),
        const DrawerItem(
          iconName: AssetsManager.languageIcon,
          text: 'Language',
        ),
        const AppConfigItem(name: 'English'),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}