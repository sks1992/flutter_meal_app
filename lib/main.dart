import 'package:flutter/material.dart';
import 'package:flutter_udemy_project_3/constants/dummy_data.dart';
import 'package:flutter_udemy_project_3/models/meals.dart';
import 'package:flutter_udemy_project_3/widgets/screens/category_meals_screen.dart';
import 'package:flutter_udemy_project_3/widgets/screens/filter_screens.dart';
import 'package:flutter_udemy_project_3/widgets/screens/meal_detail_screen.dart';
import 'package:flutter_udemy_project_3/widgets/screens/my_home_page.dart';
import 'package:flutter_udemy_project_3/widgets/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filter = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filter = filterData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (filter['glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (filter['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (filter['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filter['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isMealFavorite(String id){

    return favoriteMeals.any((meal) => meal.id ==id);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 224, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeals),
        CategoryMealsScreen.pageId: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MyHomePage.pageId: (ctx) => MyHomePage(),
        MealDetailScreen.pageId: (ctx) => MealDetailScreen(toggleFavorite,isMealFavorite),
        FilterScreen.pageId: (ctx) => FilterScreen(filter, setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryMealsScreen(availableMeals),
        );
      },
    );
  }
}
