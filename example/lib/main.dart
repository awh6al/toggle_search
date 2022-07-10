import 'package:flutter/material.dart';
import 'package:toggle_search/toggle_search.dart';

List<String> kOptions = <String>[
  'aardvark',
  'bobcat',
  'chameleon',
  'dingo',
  'elephant',
  'flamingo',
  'goose',
  'hippopotamus',
  'iguana',
  'jaguar',
  'koala',
  'lemur',
  'mouse',
  'northern white rhinoceros',
];

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: const Color(0xffe6aa0b),
    body: Center(
        child: SizedBox(
      height: 42,
      width: 400,
      child: ToggleSearch(options: kOptions),
    )),
  )));
}
