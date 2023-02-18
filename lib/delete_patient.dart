import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:patient_records/patients_list.dart';

import 'HTTPHelper.dart';

Map<String, dynamic>? mapResponse;

Map? dataResponse;
List? listResponse;

class DeletePatient extends StatefulWidget {
   DeletePatient(this.userId, {Key? key}) : super(key: key);

   String userId;


   @override
  State<DeletePatient> createState() => _DeletePatientState();
}

class _DeletePatientState extends State<DeletePatient> {
  late String userId;


  Future apishowcall() async {
    http.Response response;
    response =
    await http.get(Uri.parse("https://record-keeper.fly.dev/api/patients"));
    // print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        print(response.body);
        listResponse = json.decode(response.body)['data'];
      });
    }
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        actions: [ IconButton(
            onPressed: () async {
              //Delete
              bool deleted = await HTTPHelper().deleteItem(widget.userId);

              if (deleted) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Patient deleted')));
                setState(() async {
                  await Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => PatientLists()));
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to delete')));
              }
              setState(() {
                Navigator.pop(context);
              });

            },
            icon: Icon(Icons.delete)),
        ],
      ),
  );
}
}
