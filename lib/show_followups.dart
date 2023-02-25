import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:patient_records/show_single_followup.dart';

import 'HTTPHelper.dart';
import 'follow_ups.dart';

import 'package:http/http.dart' as http;
String? stringResponse;
Map<String, dynamic>? mapResponse;

Map? dataResponse;
List? listResponse;
class ShowFollowUps extends StatefulWidget {
   ShowFollowUps(this.userId,{Key? key}) : super(key: key);

  String userId;

  @override
  State<ShowFollowUps> createState() => _ShowFollowUpsState();
}

class _ShowFollowUpsState extends State<ShowFollowUps> {
  late Map<String, dynamic> patient;

  Future apicall(userId) async {
    http.Response response;
    response = await http
        .get(Uri.parse("https://record-keeper-migf.onrender.com/api/patients/$userId/follow_ups"));
    // print(response.statusCode);
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = json.decode(response.body)['data'];

        Map<String, dynamic>? patient = mapResponse;
        print('+++++++');
        print(mapResponse);
        print(listResponse);

        print(response.statusCode);

        print('&&&&&&&&&&&&');
        // print(patient!['weight']);

        // listResponse  = json.decode(response.body)['data'];
        // print(listResponse);
      });
    }
  }


  @override
  void initState() {
    apicall(widget.userId);
    // apishowcall();
    // apipostcall();
    // _futurePatient = HTTPHelper().getSinglePatient(widget.userId);
    // apiputcall();
    // apideletecall();
    // super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Follow Ups'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title:Text(listResponse![index]['attributes']['first_name'].toString()),
            subtitle: Text(listResponse![index]['attributes']['last_name'].toString()),
            trailing: Text(listResponse![index]['attributes']['weight'].toString()),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  ShowSingleFollowups(listResponse![index]['id'].toString(),widget.userId)));
            },
          );
        },
        itemCount: listResponse == null ? 0 : listResponse!.length,
      ),
    );
  }
}
