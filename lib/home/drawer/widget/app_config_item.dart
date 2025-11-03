import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';


import '../../../provider/app_theme_provider.dart';

class AppConfigItem extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  const AppConfigItem({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () async {
        if (name == 'Dark') {
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
                        Provider.of<AppThemeProvider>(context, listen: false)
                            .changeTheme(ThemeMode.dark);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.light_mode),
                      title: const Text('Light Mode'),
                      onTap: () {
                        Provider.of<AppThemeProvider>(context, listen: false)
                            .changeTheme(ThemeMode.light);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else if (name == 'English') {
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
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.04),
        padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
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
            Text(name, style: AppStyles.medium20White),
            const Icon(
              Icons.arrow_drop_down_outlined,
              size: 35,
              color: AppColors.whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}