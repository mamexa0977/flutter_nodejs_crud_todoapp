import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AddTodo> {
  TextEditingController title = TextEditingController();
  TextEditingController describtion = TextEditingController();

  postTodo() async {
    try {
      final res = Dio().post("http://192.168.8.104:8080/post",
          data: {"title": title.text, "describtion": describtion.text});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 150,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: " Title",
                  ),
                  controller: title,
                ),
              ),
            ),
            Card(
              elevation: 8,
              shadowColor: Colors.grey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 90),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: " descibtion",
                  ),
                  controller: describtion,
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    postTodo();
                    title.clear();
                    describtion.clear();
                    
                  },
                  child: Text("upload"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.grey))))),
            )
          ],
        ),
      ),
    );
  }
}
