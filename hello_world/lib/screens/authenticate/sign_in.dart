import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';
import 'package:hello_world/shared/const.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;
  SignIn({this.toogleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String mail = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    // Text field state

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
                label: Text("Sign in"))
          ]),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration:
                      TextInputDecoration.name("Email").textInputDecoration,
                  validator: (val) => val.isEmpty ? "Champ erroné" : null,
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
                  decoration:
                      TextInputDecoration.name("Password").textInputDecoration,
                  validator: (val) =>
                      val.length < 6 ? "Minimum 6 caractere" : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                      print(password);
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
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print(mail);
                      print(password);
                      dynamic result = await _authService
                          .logWithMailAndPassword(mail, password);
                      if (result == null) {
                        setState(() {
                          error = 'Error';
                        });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
              ],
            ),
          )),
    );
  }
}
