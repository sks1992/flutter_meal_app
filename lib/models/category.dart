import 'package:flutter/material.dart';
//create a model class for category that hold category information
class Category {
  final String id;
  final String title;
  final Color color;
//we use @required so these condition are required necessary.
 const Category({@required this.id,@required this.title, this.color =Colors.orange});
}