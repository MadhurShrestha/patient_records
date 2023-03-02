import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_records/show_followups.dart';

import 'HTTPHelper.dart';
import 'edit_single_followup.dart';


class ShowSingleFollowups extends StatefulWidget {
   const ShowSingleFollowups( this.userId,this.followupId, {Key? key}) : super(key: key);

   final String userId;
   final String followupId;

  @override
  State<ShowSingleFollowups> createState() => _ShowSingleFollowupsState();
}

class _ShowSingleFollowupsState extends State<ShowSingleFollowups> {
  String? stringResponse;
  Map<String, dynamic>? mapResponse;

  Map? dataResponse;
  List? listResponse;
  late Future<Map> _futurePatient;
  late Map patient;

  // Future apishowcall(userId, followupId) async {
  //   http.Response response;
  //   response =
  //   await http.get(Uri.parse("https://record-keeper-migf.onrender.com/api/patients/$userId/follow_ups/$followupId"));
  //   // print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print('*********************');
  //     print(response.statusCode);
  //     print('+++++++++++++++++++++');
  //
  //     setState(() {
  //       // stringResponse = response.body;
  //       mapResponse = json.decode(response.body);
  //       // print(response.body);
  //       listResponse = json.decode(response.body)['data'];
  //       print('***********************');
  //       print(listResponse);
  //       print('+++++++++++++abc+++++++++');
  //
  //     });
  //   }
  // }
  @override
  void initState() {
    super.initState();
    _futurePatient = HTTPHelper().getSingleFollowup(widget.userId, widget.followupId);
    // patient = {};
    // _getPatients();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single Followup'),
        actions: [
          IconButton(onPressed: () async{
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => EditSingleFollowup(patient)));
          }, icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () async {
                //Delete
                bool deleted = await HTTPHelper().deleteSingleFollowup(widget.userId, widget.followupId);

                if (deleted) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Followup deleted')));


                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to delete followup')));
                }
                setState(() {
                  Navigator.pop(context);

                });
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
                        'Followup Date: ${patient['attributes']['date']}',
                        style: const TextStyle(
                          fontSize: 20,
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
                        'Weight: ${patient['attributes']['weight']} ',  style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey,
                      ),

                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),  Text(
                        'Hb: ${patient['attributes']['hb']} ',  style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Blood Transfusion: ${patient['attributes']['blood_transfusion']}',  style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Hydroxyurea: ${patient['attributes']['hydroxyurea']} ',  style: const TextStyle(
                        fontSize: 20,
                        height: 01.5,
                        color: Colors.grey,
                      ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Thalidomide: ${patient['attributes']['thalidomide']} ',  style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Hydroxyurea Missed: ${patient['attributes']['hydroxyurea_missed']}',  style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Thalidomide Missed: ${patient['attributes']['thalidomide_missed']} ',  style: const TextStyle(
                        fontSize: 20,
                        height:1.5,
                        color: Colors.grey,
                      ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Side Effects: ${patient['attributes']['side_effects']} ',  style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),
                      Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Patient ID: ${patient['attributes']['patient_id']} ',  style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),Divider(
                        thickness: 3,
                        color: Colors.black12,
                      ),
                      SizedBox(height: 10),Text(
                        'Remarks: ${patient['attributes']['remarks']} ',  style: const TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                      ),

                    ],
                  ),
                ),
              ),
            );

            // return Column(
            //   children: [
            //
            //     Text('${patient}'),
            //     Text(
            //       '${patient['attributes']['weight']}',
            //     )
            //   ],
            // );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
