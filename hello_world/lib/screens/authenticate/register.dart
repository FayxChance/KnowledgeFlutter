import 'package:flutter/material.dart';
import 'package:hello_world/services/auth.dart';
import 'package:hello_world/shared/const.dart';

class Register extends StatefulWidget {
  final Function toogleView;
  Register({this.toogleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  // Text field state
  String mail = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
          elevation: 0.0,
          title: Text('Register'),
          backgroundColor: Colors.teal[300],
          actions: [
            FlatButton.icon(
                onPressed: () {
                  widget.toogleView();
                },
                icon: Icon(Icons.person),
                label: Text("Log In"))
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
                    });
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  color: Colors.tealAccent,
                  child:
                      Text("Register", style: TextStyle(color: Colors.white)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _authService
                          .registerWithMailAndPassword(mail, password);
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
