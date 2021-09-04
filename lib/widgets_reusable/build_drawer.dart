import 'package:flutter/material.dart';
import 'package:flutter_udemy_project_3/constants/style.dart';
import 'package:flutter_udemy_project_3/widgets/screens/filter_screens.dart';

import 'build_list_tile.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking App!',
              style: kDrawerTextStyle,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          BuildListTile(
            "Meals",
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          BuildListTile(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.pageId);
            },
          ),
        ],
      ),
    );
  }
}
