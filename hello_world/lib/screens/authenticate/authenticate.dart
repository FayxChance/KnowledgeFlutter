import 'package:flutter/material.dart';
import 'package:hello_world/screens/authenticate/sign_in.dart';
import 'package:hello_world/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toogleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? Container(
            child: SignIn(toogleView: toogleView),
          )
        : Container(
            child: Register(toogleView: toogleView),
          );
  }
}
