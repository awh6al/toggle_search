import 'package:flutter/material.dart';
import 'package:toggle_search/toggle_search.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(
    backgroundColor: Color(0xffe6aa0b),
    body: Center(
        child: SizedBox(
      width: 400,
      child: ToggleSearch(),
    )),
  )));
}
