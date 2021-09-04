import 'package:flutter/material.dart';
import 'package:flutter_udemy_project_3/models/meals.dart';
import 'package:flutter_udemy_project_3/widgets/items/meal_items.dart';

class FavoritesScreen extends StatelessWidget {

  final List<Meal> favoriteMeals;

   FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {

    if(favoriteMeals.isEmpty){
      return Center(
        child: Text("You have no favorites yet -start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItems(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }

  }
}
