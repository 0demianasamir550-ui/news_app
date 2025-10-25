import 'package:flutter/material.dart';
import 'package:news_app/home/category_fragment/category_fragment.dart';
import 'package:news_app/utils/app_colors.dart';
import 'category_details/category_details.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.headlineLarge,
        ),

      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(),
      ),
      body: CategoryFragment(),
    );
  }
}