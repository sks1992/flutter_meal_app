import 'package:flutter/material.dart';

class BuildSelectionTitle extends StatelessWidget {

  final String text;

  BuildSelectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
