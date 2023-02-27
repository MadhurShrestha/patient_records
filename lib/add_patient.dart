import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  TextEditingController dateController = TextEditingController();
  TextEditingController transfussionRequirementController =
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
                  hintText: 'Phone Number',
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
                  hintText: 'Weight',
                  counter: SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: transfussionRequirementController,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: const InputDecoration(
                  hintText: 'Transfussion Requirement',
                  counter: SizedBox.shrink(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
            ),
            TextField(
              controller: dateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                hintText: 'Date',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context, initialDate: DateTime.now(),
                    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101)
                );

                if(pickedDate != null ){
                  print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dateController.text = formattedDate; //set output date to TextField value.
                  });
                }else{
                  print("Date is not selected");
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
                        'patient[age]': ageController.text,
                        'patient[weight]': weightController.text,
                        'patient[start_date]': dateController.text,
                        // 'patient[gender]': genderController.text,
                        'patient[contact_number]' : numberController.text,
                        'patient[mean_hb]': meanHbController.text,
                        'patient[transfussion_requirement]': transfussionRequirementController.text,
                        'patient[serum_ferritin]': serumFerritinController.text,

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
