import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;
  SignIn({this.toogleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    // Text field state
    String mail = '';
    String password = '';
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
          elevation: 0.0,
          title: Text('Log in'),
          backgroundColor: Colors.teal[300],
          actions: [
            FlatButton.icon(
                onPressed: () {
                  widget.toogleView();
                },
                icon: Icon(Icons.person),
                label: Text("Register"))
          ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      mail = val;
                    });
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.tealAccent,
                  child: Text("Log In", style: TextStyle(color: Colors.white)),
                  onPressed: () async {},
                )
              ],
            ),
          )),
    );
  }
}
