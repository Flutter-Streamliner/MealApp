import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var _glutenFree = false;
  var _vegeterianFree = false;
  var _veganFree = false;
  var _lactoseFree = false;

  Widget buildSwitchListTile({String title, String description, bool currentValue, Function updateValue}){
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body:  Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child:  Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildSwitchListTile(
                  title: 'Gluten-free',
                  description: 'Only include gluten-free meals.',
                  currentValue: _glutenFree, 
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }
                ),
                buildSwitchListTile(
                  title: 'Vegeterian-free',
                  description: 'Only include vegeterian-free meals.',
                  currentValue: _vegeterianFree, 
                  updateValue: (newValue) {
                    setState(() {
                      _vegeterianFree = newValue;
                    });
                  }
                ),
                buildSwitchListTile(
                  title: 'Vegan-free',
                  description: 'Only include vegan-free meals.',
                  currentValue: _veganFree, 
                  updateValue: (newValue) {
                    setState(() {
                      _veganFree = newValue;
                    });
                  }
                ),
                buildSwitchListTile(
                  title: 'Lactose-free',
                  description: 'Only include lactose-free meals.',
                  currentValue: _lactoseFree, 
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}