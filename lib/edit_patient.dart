import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_records/patients_list.dart';

import 'HTTPHelper.dart';
import 'edit_single_patient.dart';

class EditPatient extends StatefulWidget {
  EditPatient(this.userId, {Key? key}) : super(key: key);

  String userId;

  @override
  State<EditPatient> createState() => _EditPatientState();
}

class _EditPatientState extends State<EditPatient> {
  String? stringResponse;
  Map<String, dynamic>? mapResponse;

  Map? dataResponse;
  List? listResponse;
  late Future<Map> _futurePatient;
  late Map patient;

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
  void initState() {
    apishowcall();
    super.initState();
    _futurePatient = HTTPHelper().getSinglePatient(widget.userId);
    // patient = {};
    // _getPatients();
  }

  _getPatients() async {
    Map patients = await HTTPHelper().showPatients();
    setState(() {
      patient = patients;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Record'),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => EditSinglePatient(patient)));

              },
              icon: Icon(Icons.edit)),
          IconButton(
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
      body: FutureBuilder<Map>(
        future: _futurePatient,
        builder: (context, snapshot) {
          // print(snapshot.hasError);
          if (snapshot.hasError) {
            print('All is well');
            return Text('Some error  ${snapshot.error}');
          }
          if (snapshot.hasData) {
            patient = snapshot.data!['data'];
            // print(patient);
            return Column(
              children: [
                Text(
                  '${patient['id']}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20),
                ),
                Text(
                  '${patient['attributes']['first_name']}',
                )
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
