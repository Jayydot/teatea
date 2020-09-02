import 'package:flutter/material.dart';
import 'package:firebase_project/models/tea.dart';

class TeaTile extends StatelessWidget {
  final Tea tea;
  TeaTile({this.tea});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(2, 6, 2, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[tea.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(tea.name),
          subtitle: Text('Takes ${tea.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
