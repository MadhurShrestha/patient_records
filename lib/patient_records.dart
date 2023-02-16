import 'package:flutter/material.dart';
import 'package:patient_records/patients.dart';

class PatientRecords extends StatefulWidget {
  const PatientRecords({Key? key}) : super(key: key);

  @override
  State<PatientRecords> createState() => _PatientRecordsState();
}
List<Patient> patients = List.empty(growable: true);

class _PatientRecordsState extends State<PatientRecords> {


  @override
  Widget build(BuildContext context) {
    return Container(
        child: patients.isEmpty ? const Text('No patients yet..',style: TextStyle(fontSize: 22),)
            : Expanded(
          child: ListView.builder(
            itemCount: patients.length,
            itemBuilder: (context, index) => getRow(index),
          ),
        )

    );
  }
}


Widget getRow(int index) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor:
        index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
        foregroundColor: Colors.white,
        child: Text(
          patients[index].firstName[0],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            patients[index].lastName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(patients[index].number),
        ],
      ),

    ),

  );

}


// Expanded(
// child: ListView.builder(
// itemCount: patients.length,
// itemBuilder: (context, index) => getRow(index),
// ),
// )