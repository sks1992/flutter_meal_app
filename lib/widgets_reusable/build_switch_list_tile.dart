import 'package:flutter/material.dart';

class BuildSwitchListTile extends StatelessWidget {
  final String title;
  final String description;
  final bool currentValue;
  final Function updateValue;

  BuildSwitchListTile(
      {this.title, this.description, this.currentValue, this.updateValue});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
}
