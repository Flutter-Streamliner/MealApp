import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

class MealItem extends StatelessWidget {

  final Meal item;

  String get complexity {
    switch (item.complexity) {
      case Complexity.Simple: 
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';  
      default:
        return 'Unknown';
    } 
  }

  String get affordability {
    switch (item.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';  
      default:
        return 'Unknown';  
    }
  }

  MealItem({@required this.item});

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(item.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    item.title, 
                    style: TextStyle(
                      fontSize: 26, 
                      color: Colors.white,
                    ), 
                    softWrap: true, 
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('${item.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text(complexity),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text(affordability),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}