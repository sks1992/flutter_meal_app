import 'package:flutter/material.dart';
import 'package:flutter_udemy_project_3/widgets_reusable/build_drawer.dart';
import 'package:flutter_udemy_project_3/widgets_reusable/build_switch_list_tile.dart';

class FilterScreen extends StatefulWidget {
  static const pageId = "/filter";

  final Function saveFilters;
  final Map<String,bool> currentFilter;

  FilterScreen(this.currentFilter,this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  @override
  void initState() {
    super.initState();

    glutenFree =widget.currentFilter['glutenFree'];
    vegetarian =widget.currentFilter['vegetarian'];
    vegan =widget.currentFilter['vegan'];
    lactoseFree =widget.currentFilter['lactoseFree'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filter"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilter = {
                'glutenFree': glutenFree,
                'vegetarian': vegetarian,
                'vegan': vegan,
                'lactoseFree': lactoseFree,
              };
              widget.saveFilters(selectedFilter);
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Adjust Your Meal Selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                BuildSwitchListTile(
                  title: "Gluten Free",
                  description: "Only Include Gluten free meal.",
                  currentValue: glutenFree,
                  updateValue: (value) {
                    setState(() {
                      glutenFree = value;
                    });
                  },
                ),
                BuildSwitchListTile(
                  title: "Vegetarian ",
                  description: "Only Include Vegetarian meal.",
                  currentValue: vegetarian,
                  updateValue: (value) {
                    setState(() {
                      vegetarian = value;
                    });
                  },
                ),
                BuildSwitchListTile(
                  title: "Vegan ",
                  description: "Only Include Veagn meal.",
                  currentValue: vegan,
                  updateValue: (value) {
                    setState(() {
                      vegan = value;
                    });
                  },
                ),
                BuildSwitchListTile(
                  title: "Gluten Free",
                  description: "Only Include Lactose free meal.",
                  currentValue: lactoseFree,
                  updateValue: (value) {
                    setState(() {
                      lactoseFree = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
