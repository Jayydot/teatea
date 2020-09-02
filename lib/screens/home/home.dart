// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/models/tea.dart';
import 'package:firebase_project/screens/home/tea_list.dart';
import 'package:firebase_project/screens/home/update_form.dart';
import 'package:firebase_project/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_project/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 60.0,
              ),
              child: UpdateForm(),
            );
          });
    }

    return StreamProvider<List<Tea>>.value(
      value: DatabaseService().tea,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text(
            'Tea Tea',
          ),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.person,
                color: Colors.black38,
              ),
              label: Text(
                'logout',
                style: TextStyle(
                  color: Colors.white38,
                ),
              ),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.update,
                color: Colors.black38,
              ),
              label: Text(
                'Update',
                style: TextStyle(
                  color: Colors.white38,
                ),
              ),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/coffee_bg.png'), fit: BoxFit.cover),
            ),
            child: TeaList()),
      ),
    );
  }
}
