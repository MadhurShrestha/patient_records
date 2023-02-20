import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:patient_records/add_patient.dart';
import 'package:patient_records/search_bar.dart';

import 'edit_patient.dart';
import 'model/PatientsModel.dart';

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
        await http.get(Uri.parse("https://record-keeper.fly.dev/api/patients"));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = json.decode(response.body)['data'];
      });
    }
  }

  Future<PatientsModel> getPatientsModelApi() async {
    final response = await http
        .get(Uri.parse('https://record-keeper.fly.dev/api/patients/'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return PatientsModel.fromJson(data);
    } else {
      return PatientsModel.fromJson(data);
    }
  }

  @override
  void initState() {
    getPatientsModelApi();
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
      body: FutureBuilder<PatientsModel>(
          future: getPatientsModelApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: Text(snapshot.data!.data![index].id!),
                          title: Text("${snapshot
                              .data!.data![index].attributes!.firstName!} ${snapshot.data!.data![index].attributes!.lastName}"),
                          subtitle: Text("${snapshot
                              .data!.data![index].attributes!.weight.toString()} kg" ),
                          trailing: Text("${snapshot.data!.data![index].attributes!.age.toString()} years"),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditPatient(
                                    snapshot.data!.data![index].id!)));
                          },
                        ),
                        const Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                      ],
                    );
                  });
            } else {
              return Text('Loading');
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPatient()));
          setState(() {
            getPatientsModelApi();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
