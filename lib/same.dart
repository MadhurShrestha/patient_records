//reqres sample example
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'DataModel.dart';
import 'home_page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(title: "Post"),
    );
  }

}

class MyPage extends StatefulWidget {
  const MyPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyPage> createState() => _MyPageState();
}

Future<DataModel?> submitData (String name, String job) async {
  var response = await http.post(Uri.https('reqres.in', '/api/users'), body: {
    "name" : name, "job" : job,
  });
  var data= response.body;
  print(data);

  if(response.statusCode == 201) {
    String responseString =  response.body;
    return dataModelFromJson(responseString);
  }
  else {
    return null;
  }
}
class _MyPageState extends State<MyPage> {
  late DataModel _dataModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  // TextEditingController idController = TextEditingController();
  // TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name:'),
                controller: nameController,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Title:'),
                controller: jobController,

              ),
              // TextField(
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'Body:'),
              //   controller: bodyController,
              //
              // ),TextField(
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(),
              //       hintText: 'Job:'),
              //   controller: idController,
              // ),
              ElevatedButton(onPressed: () async{
                String name = nameController.text;
                String job = jobController.text;
                // String userId = titleController.text;
                // String body = titleController.text;


                DataModel? data = await submitData(name, job);

                setState(() {
                  _dataModel = data!;
                });
              }, child: Text('Submit'))

            ],
          ),
        ),

      ),
    );
  }
}


