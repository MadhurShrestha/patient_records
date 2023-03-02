import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_records/add_patient.dart';
import 'package:patient_records/search_bar.dart';

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


  Future apishowcall() async {
    http.Response response;
    response =
        await http.get(Uri.parse("https://record-keeper-migf.onrender.com/api/patients"));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = json.decode(response.body)['data'];
        print('************************');
        print(mapResponse);
        print('************************');
        print(listResponse);
      });
    }
  }




  @override
  void initState() {
    // apicall();
    apishowcall();
    // apipostcall();
    // apiputcall();
    // apideletecall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
        automaticallyImplyLeading: false,
        actions: [
          // IconButton(
          //   onPressed: () {
          //     showSearch(context: context, delegate: SearchUser());
          //   },
          //   icon: Icon(Icons.search_sharp),
          // )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title:Text('${listResponse![index]['attributes']['first_name']} ${listResponse![index]['attributes']['last_name']}'.toString()),
            trailing: Text(listResponse![index]['attributes']['weight'].toString()),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  EditPatient(listResponse![index]['id'].toString())));
            },
          );
        },

        itemCount: listResponse == null ? 0 : listResponse!.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddPatient()));
          setState(() {
            apishowcall();

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
