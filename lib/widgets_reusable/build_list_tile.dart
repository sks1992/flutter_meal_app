import 'package:flutter/material.dart';
import 'package:flutter_udemy_project_3/constants/style.dart';

class BuildListTile extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function tabHandler;


  BuildListTile(this.title, this.icon,this.tabHandler);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: kDrawerListTileTextStyle,
      ),
      onTap: tabHandler,
    );
  }
}
