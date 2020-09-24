import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[400],
        title: Text("Home"),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("Log out")),
        ],
      ),
    );
  }
}
