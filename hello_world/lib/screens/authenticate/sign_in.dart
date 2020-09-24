import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[300],
        elevation: 0.0,
        title: Text('Sign in'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
          child: Text(" Sign in anon"),
          onPressed: () async {
            dynamic result = await _authService.signInAnon();
            if (result == null) {
              print("error signing in anon");
            } else {
              print('Signed in');
              print(result);
            }
          },
        ),
      ),
    );
  }
}
