import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:patient_records/follow_ups.dart';
import 'package:patient_records/patients_list.dart';
import 'package:patient_records/show_followups.dart';

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
        await http.get(Uri.parse("https://record-keeper-migf.onrender.com/api/patients"));
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

  Widget _buildCard(BuildContext context,String stat, Color color) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: 80,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(stat, style: TextStyle(
                      fontSize: 25,
                      height: 0.80,
                    color: color
                    ),
                  ),
                ]
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Record' ),
        actions: [
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => EditSinglePatient(patient)));

              },
              icon: Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ShowFollowUps(widget.userId)));

              },
              icon: Icon(Icons.book_online)),

    // Navigator.pop(context);
    // await Navigator.of(context).push(MaterialPageRoute(
    // builder: (_) => ShowFollowUps(widget.patient['id'])));
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
          // final lastFollowUpDate = patient['attributes']['last_follow_up_date'];
          // final formattedDate = DateFormat('yyyy-MM-dd').format(lastFollowUpDate);
          if (snapshot.hasData) {
            patient = snapshot.data!['data'];
            // print(patient);
            return Container(
              padding: EdgeInsets.fromLTRB(10,10,10,0),
              width: double.maxFinite,
              height: double.maxFinite,
              child: Card(
                elevation: 15,
                child: Center(
                  child: Column(
                    children: [

                      Divider(),


                      Text(
                        'Patient ID: ${patient['id']}',
                        style: const TextStyle(
                          fontSize: 25,
                          height: 1,
                          color: Colors.greenAccent,
                        ),
                      ),

                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Name: ${patient['attributes']['first_name']} ${patient['attributes']['last_name']}',  style: const TextStyle(
                        fontSize: 25,
                        height: 1.5,
                        color: Colors.grey,
                      ),

                      ),
                //   Divider(
                //   thickness: 2,
                //   color: Colors.black12,
                // ),SizedBox(height: 10),
                //       Text(
                //         'Gender: ${patient['attributes']['gender']}',  style: const TextStyle(
                //         fontSize: 25,
                //         height: 1.5,
                //         color: Colors.grey,
                //       ),
                //
                //       ),
                      Divider(
                        thickness: 2,
                        color: Colors.black12,
                      ),
                SizedBox(height: 10),  Text(
                        'Age: ${patient['attributes']['age']} ',  style: const TextStyle(
                        fontSize: 25,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
              Divider(
                thickness: 3,
                color: Colors.black12,
              ),
              SizedBox(height: 10),Text(
                        'Weight: ${patient['attributes']['weight']}',  style: const TextStyle(
                        fontSize: 25,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
              Divider(
                thickness: 3,
                color: Colors.black12,
              ),
              SizedBox(height: 10),Text(
                        'Contact Number: ${patient['attributes']['contact_number']} ',  style: const TextStyle(
                        fontSize: 25,
                        height: 01.5,
                        color: Colors.grey,
                      ),
                      ),
              Divider(
                thickness: 3,
                color: Colors.black12,
              ),
              SizedBox(height: 10),Text(
                        'Mean Hb: ${patient['attributes']['mean_hb']} ',  style: const TextStyle(
                        fontSize: 25,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
              Divider(
                thickness: 3,
                color: Colors.black12,
              ),
              SizedBox(height: 10),Text(
                        'Transfusion Requirement: ${patient['attributes']['transfussion_requirement']}',  style: const TextStyle(
                        fontSize: 25,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
              Divider(
                thickness: 3,
                color: Colors.black12,
              ),
              SizedBox(height: 10),Text(
                'Serum Ferritin: ${patient['attributes']['serum_ferritin']} ',  style: const TextStyle(
                fontSize: 25,
                height:1.5,
                color: Colors.grey,
                ),
              ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Date: ${patient['attributes']['start_date']} ',  style: const TextStyle(
                        fontSize: 25,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),


                Text(
                        'Last Followup Date: ${(patient['attributes']['last_follow_up_date'])} ',  style: const TextStyle(
                        fontSize: 25,
                        height: 1.5,
                        color: Colors.grey,
                      ),

                ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());

        },

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FollowUps(patient)));
          // setState(() {
          //   apishowcall();
          //
          // });
        },
        child: Icon(Icons.add),
      ),

    );
  }
}
