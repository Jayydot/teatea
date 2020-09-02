import 'package:firebase_project/screens/home/home.dart';
import 'package:provider/provider.dart';

import '../screens/authenticate/authenticate.dart';
import 'package:firebase_project/models/user.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either home or authenticate widget

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
