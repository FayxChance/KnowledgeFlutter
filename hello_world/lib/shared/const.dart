import 'package:flutter/material.dart';

class TextInputDecoration {
  InputDecoration textInputDecoration;

  TextInputDecoration() {
    textInputDecoration = InputDecoration(
        hintText: "Email",
        filled: true,
        fillColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 2.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green[300], width: 2.0)));
  }
  TextInputDecoration.name(String name) {
    textInputDecoration = InputDecoration(
        hintText: name,
        filled: true,
        fillColor: Colors.white70,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 2.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green[300], width: 2.0)));
  }
}
