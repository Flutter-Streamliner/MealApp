import 'package:flutter/material.dart';
import 'package:meal_app/category_item.dart';
import 'package:meal_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body : GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES.map((cat) => CategoryItem(id: cat.id, title: cat.title, color: cat.color,)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        ),
      ),
    );
  }
}