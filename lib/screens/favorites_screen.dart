import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.length == 0
    ? Center(
      child: Text('You have no favorites yet - start adding some!'),
    )
    : ListView.builder(
      itemBuilder: (context, index) => MealItem(item: favoriteMeals[index], removeItem: (){},),
      itemCount: favoriteMeals.length,
    );
  }
}