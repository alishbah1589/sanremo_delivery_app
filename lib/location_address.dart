import 'package:flutter/material.dart';

class locationAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      child: ListTile(
        leading: Icon(Icons.location_pin),
        title: Text("636/161"),
        subtitle: Text("Bahawalpur"),
        trailing: IconButton(icon: Icon(Icons.edit),onPressed: () {}),
      ),
    );
  }
}