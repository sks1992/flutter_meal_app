import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {

  static const pageId ="/home";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MEALS APP"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Navigation"),
      ),
    );
  }
}