import 'package:flutter/material.dart';
import 'package:news_app/home/category_fragment/category_fragment.dart';
import 'package:news_app/utils/app_colors.dart';
import '../model/category.dart';
import 'category_details/category_details.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null?
          'Home':selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
      ),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(category: selectedCategory!),
    );
  }

  void onCategoryItemClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}