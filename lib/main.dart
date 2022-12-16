import 'package:flutter/material.dart';
import 'package:peso_ideal/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.green,
    ),
    home: const Home(),
  ));
}
