import 'package:flutter/material.dart';
import 'package:flutter_udemy_project_3/constants/dummy_data.dart';
import 'package:flutter_udemy_project_3/widgets/items/category_items.dart';

//this class control how we show our meals  dish in screen
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(15.0),
        //A delegate that controls the layout of the children within the GridView
        gridDelegate:
            //Creates a delegate that makes grid layouts with tiles that have a
            // maximum cross-axis extent
            SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          //1
          //The ratio of the cross-axis to the main-axis extent of each child.
          childAspectRatio: 3 / 2,
          //The number of logical pixels between each child along the cross axis.
          crossAxisSpacing: 20,
          //The number of logical pixels between each child along the main axis.
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (categoryData) =>
                  CategoryItems(categoryData.id,categoryData.title, categoryData.color),
            )
            .toList(),
    );
  }
}

/**
    1.  maxCrossAxisExtent =>
    The maximum extent of tiles in the cross axis.
    This delegate will select a cross-axis extent for the tiles that is as large
    as possible subject to the following conditions:

    1.The extent evenly divides the cross-axis extent of the grid.
    2.The extent is at most maxCrossAxisExtent.

    For example, if the grid is vertical, the grid is 500.0 pixels wide, and
    maxCrossAxisExtent is 150.0, this delegate will create a grid with 4 columns
    that are 125.0 pixels wide.
 */
