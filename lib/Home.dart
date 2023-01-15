import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<dynamic> userData;
  bool Loading = false;
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    try {
      // final todo = await Dio().get("https://jsonplaceholder.typicode.com/todos");
      http.Response todos =
          await http.get(Uri.parse("http://192.168.8.104:8080/all"));

      data = jsonDecode(todos.body.toString());

      print(data);
      setState(() {
        // userData = data;
        // Loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  deleteData({required Map<String, dynamic> data}) async {
    try {
      // final todo = await Dio().get("https://jsonplaceholder.typicode.com/todos");
      http.Response todos = await http
          .delete(Uri.parse("http://192.168.8.104:8080/${data['_id']}"));

      data = jsonDecode(todos.body.toString());
      print('${data['_id']}');

      setState(() {
        // userData = data;
        // Loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Title:   ' + data[index]['title'].toString(),
                          style: TextStyle(fontSize: 30)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(data[index]['describtion'].toString(),
                          style: TextStyle(fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  deleteData(data: data[index]);
                                });
                              },
                            ),
                          ),
                          Text(
                            data[index]['uploaddate'].toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
