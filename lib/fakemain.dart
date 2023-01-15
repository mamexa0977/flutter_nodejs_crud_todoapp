import 'package:assignment/Home.dart';
import 'package:assignment/addtodo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Fakemain());
}

class Fakemain extends StatefulWidget {
  const Fakemain({super.key});

  @override
  State<Fakemain> createState() => _FakemainState();
}

class _FakemainState extends State<Fakemain> {
  // This widget is the root of your application.
  int currrentpage = 0;
  final screens = [Home(), AddTodo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currrentpage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currrentpage,
          onTap: (value) => setState(() => currrentpage = value),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'list'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'add')
          ]),
    );
  }
}
