import 'package:flutter/material.dart';
import 'package:hello_world/models/user.dart';
import 'package:hello_world/screens/authenticate/authenticate.dart';
import 'package:hello_world/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Return Home ou Authenticate
    final user = Provider.of<User>(context);
    print(user);
    return Authenticate();
  }
}
