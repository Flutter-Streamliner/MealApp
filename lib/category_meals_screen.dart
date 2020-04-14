import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

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
      body: ListView.builder(
        itemBuilder: (context, index) {

        },
        itemCount: DUMMY_MEALS.length,
      ),
    );
  }
}