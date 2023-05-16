import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Futuremappage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future Map")),
      body: FutureBuilder(
        future: callingapi(),
        builder: (context, AsyncSnapshot<Map> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
              return Card(child: ListTile(
                title: Text("${snapshot.data!['posts'][index]['title']}"),
              ),);
            },);

      },),
    );
  }

Future<Map> callingapi() async {
  var url = Uri.parse('https://dummyjson.com/posts');
  var response = await http.get(url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  var dcode = jsonDecode(response.body);
  return dcode;
  }
}
