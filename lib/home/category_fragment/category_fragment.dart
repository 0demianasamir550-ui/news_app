import 'package:flutter/material.dart';
import 'package:news_app/home/category_fragment/category_item.dart';

import '../../model/category.dart';

class CategoryFragment extends StatelessWidget {
  CategoryFragment({super.key});
  List<Category> categorieslist = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    categorieslist = Category.getCategorisList(true);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(
                top: height*0.02
              ),
              itemBuilder: (context, index) {
                return CategoryItem(category: categorieslist[index],index: index,);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: categorieslist.length,
            ),
          ),
        ],
      ),
    );
  }
}