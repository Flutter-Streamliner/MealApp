import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {

  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen(this.toggleFavorite, this.isMealFavorite);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer({Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavorite(mealId) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
        onPressed: (){
          toggleFavorite(mealId);
          //Navigator.of(context).pop(mealId);
        },
      ),
      body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            Container(
              height: 300, 
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
                    child: Text(selectedMeal.ingredients[index]),
                  )
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${index + 1}'),),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      )
    );
  }
}