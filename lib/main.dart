import 'package:assignment/Home.dart';
import 'package:assignment/addtodo.dart';
import 'package:assignment/fakemain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Fakemain());
  }
}
