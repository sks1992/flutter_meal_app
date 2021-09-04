import 'package:flutter/material.dart';
import 'package:flutter_udemy_project_3/constants/dummy_data.dart';
import 'package:flutter_udemy_project_3/models/meals.dart';
import 'package:flutter_udemy_project_3/widgets/items/meal_items.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const pageId = "/category-meals";

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var loadInitData = false;

//we use didChangeDependencies in place of initState because initState not work with context
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!loadInitData) {
      //to get arguments from categoryItems we use
      // ModalRoute.of(context).settings.arguments and tell the map contain
      //key value in Map<String,String> format
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArguments['title'];
      final categoryId = routeArguments['id'];

      //Returns a new lazy Iterable with all elements that satisfy the predicate
      // test here in Dummy_Meals list it check for all meals and return corresponding value;
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      loadInitData = true;
    }
  }

  void removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      //Creates a scrollable, linear array of widgets that are created on demand.
      //we use ListView.builder because we don't know number of item need to show
      // itemBuilder provide ue with a method so that this method will be call for
      //every item in list and add item to screen
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}

/*
Change 1=>
class CategoryMealsScreen extends StatelessWidget {

  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child:Text("The Recipes for the Categories"),
      ),
    );
  }
}

*/
