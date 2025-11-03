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
        AppConfigItem(
          name: 'Dark',
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Choose Theme Mode'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.dark_mode),
                        title: const Text('Dark Mode'),
                        onTap: () {

                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.light_mode),
                        title: const Text('Light Mode'),
                        onTap: () {

                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),

        SizedBox(height: height * 0.02),
        const DividerItem(),


        const DrawerItem(
          iconName: AssetsManager.languageIcon,
          text: 'Language',
        ),
        AppConfigItem(
          name: 'English',
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Choose Language'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: const Text('English'),
                        onTap: () {

                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.translate),
                        title: const Text('Arabic'),
                        onTap: () {

                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),

        SizedBox(height: height * 0.02),
      ],
    );
  }
}