import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_records/add_patient.dart';
import 'package:patient_records/single_patient.dart';

import 'edit_patient.dart';

String? stringResponse;
Map<String, dynamic>? mapResponse;

Map? dataResponse;
List? listResponse;

class PatientLists extends StatefulWidget {
  const PatientLists({Key? key}) : super(key: key);

  @override
  State<PatientLists> createState() => _PatientListsState();
}

class _PatientListsState extends State<PatientLists> {
  Future apicall(itemId) async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://record-keeper.fly.dev/api/patients/1"));
    // print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        print(response.body);
        // listResponse  = json.decode(response.body)['data'];
      });
    }
  }

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

  Future apipostcall() async {
    http.Response response;
    response = await http.post(
        Uri.parse("https://record-keeper.fly.dev/api/patients"),
        body: {"patient[first_name]": 'aajhagf'});
    if (response.statusCode == 201) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        print(response.body);
      });
    }
  }

  Future apiputcall() async {
    http.Response response;
    response = await http.put(
      Uri.parse("https://record-keeper.fly.dev/api/patients/2"),
      body: {
        'patient[first_name]': 'Ali',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        print(response.body);
      });
    }
  }

  Future apideletecall() async {
    http.Response response;
    response = await http
        .delete(Uri.parse("https://record-keeper.fly.dev/api/patients/4"));
    // print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        print(response.body);
      });
    }
  }

  @override
  void initState() {
    // apicall();
    apishowcall();
    // apipostcall();
    // apiputcall();
    apideletecall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
      ),      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddPatient()));

      },
      child: Icon(Icons.add),
    ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(listResponse![index]['id'].toString()),
            title:Text(listResponse![index]['attributes']['first_name'].toString()),
            subtitle: Text(listResponse![index]['attributes']['last_name'].toString()),
            trailing: Text(listResponse![index]['attributes']['weight'].toString()),
            onTap: () {
              // print('++++++++++++++++++++');
              // print(listResponse![index]['id']);
              // print(index);
              // print('++++++++++++++++++++');
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  EditPatient(listResponse![index]['id'].toString())));
            }
            ,
          );
          // return Container(
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.all(8.0),
          //       ),
          //       Text(listResponse![index]['id'].toString()),
          //       Text(listResponse![index]['attributes']['first_name']
          //           .toString()),
          //       Text(
          //           listResponse![index]['attributes']['last_name'].toString()),
          //       Text(listResponse![index]['attributes']['weight'].toString()),
          //     ],
          //   ),
          // );
        },
        itemCount: listResponse == null ? 0 : listResponse!.length,
      ),
    );
  }
}
