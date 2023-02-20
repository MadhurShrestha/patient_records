//reqres sample example

import 'package:flutter/material.dart';
import 'package:patient_records/patients_list.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white12,
      home: PatientLists(),
    );
  }
}
