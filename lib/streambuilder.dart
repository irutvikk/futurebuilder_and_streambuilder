import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Streambuilderpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder"),
      ),
      body: StreamBuilder(
        stream: mystream(),
        builder: (context, AsyncSnapshot<List> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text("${snapshot.data![index]['name']}"),
                ),
              );
            },);
          }
      },),
    );
  }

  Stream<List> mystream() async* {
    while(true){
      Future.delayed(Duration(seconds: 5));
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      List listdata=json.decode(response.body);
      yield listdata;
    }
  }
}
// List mylist = json.decode(response.data.toString());
// List mylist=[];
// mylist.add(response.data);
// print("map======$mylist=======");
