import 'package:flutter/material.dart';
import 'package:flutter_udemy_project_3/widgets/screens/category_meals_screen.dart';

class CategoryItems extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItems(this.id, this.title, this.color);

  //for navigation we use  pushNamed it take page rute and arguments.in arguments
  //we can pass anything.there we pass a map that store id nad title
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.pageId,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //we use inkwell because it produce ripple effect when onTap
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      onTap: () => selectCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
