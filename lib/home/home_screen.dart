import 'package:flutter/material.dart';
import 'category_details/category_details.dart';

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
        centerTitle: true,
      ),
      body: const CategoryDetails(),
    );
  }
}