import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'HTTPHelper.dart';


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

  Future apishowcall(userId, followupId) async {
    http.Response response;
    response =
    await http.get(Uri.parse("https://record-keeper-migf.onrender.com/api/patients/$userId/follow_ups/$followupId"));
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print('*********************');
      print(response.statusCode);
      print('+++++++++++++++++++++');

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
                  '${patient['attributes']['patient_id']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 20),
                ),
                Text('${patient}'),
                Text(
                  '${patient['attributes']['weight']}',
                )
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());

        },

      ),



    );
  }
}
