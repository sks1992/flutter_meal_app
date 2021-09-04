import 'package:flutter/material.dart';

class BuildContainer extends StatelessWidget {
  final Widget child;

  BuildContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      height: 250,
      width: 400,
      child: child,
    );
  }
}
