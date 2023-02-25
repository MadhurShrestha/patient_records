import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'HTTPHelper.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({Key? key}) : super(key: key);

  @override
  State<AddPatient> createState() => _AddPatientState();
}
class _AddPatientState extends State<AddPatient> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController transfusionRequirementController =
  TextEditingController();
  TextEditingController meanHbController = TextEditingController();
  TextEditingController serumFerritinController = TextEditingController();
  final fieldText = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Patients'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [

              TextField(
              controller: firstNameController,
              decoration: const InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                  hintText: 'Patient Number',
                  counter: SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(
                  hintText: 'Age',
                  counter: SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(
                  hintText: 'Age',
                  counter: SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: transfusionRequirementController,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(
                  hintText: 'Transfusion Requirement',
                  counter: SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: _date,
              decoration: const InputDecoration(
                hintText: 'Date',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2500));

                if (pickeddate != null) {
                  setState(() {
                    _date.text = DateFormat('yyyy-mm-dd').format(pickeddate);
                  });
                }
              },
            ),
            TextField(
              controller: meanHbController,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(
                  hintText: 'Mean HB',
                  counter: SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: serumFerritinController,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(
                  hintText: 'Serum Ferritin',
                  counter: SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
                ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> dataToUpdate = {
                        'patient[first_name]': firstNameController.text,
                        'patient[last_name]': lastNameController.text,
                      };
                      // print(dataToUpdate);

                      bool status = await HTTPHelper()
                          .addPatient(dataToUpdate);
                      // print(status);

                      if (status) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Patient Added')));
                      }
                      else
                      {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Failed to add patient')));
                      }
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Submit')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
