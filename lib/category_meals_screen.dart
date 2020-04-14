import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-measl';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: const Center(
        child: const Text('The recipes for the category!'),
      ),
    );
  }
}