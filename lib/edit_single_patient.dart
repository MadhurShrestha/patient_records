import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_records/edit_patient.dart';
import 'package:patient_records/patients_list.dart';

import '../HTTPHelper.dart';


class EditSinglePatient extends StatefulWidget {
   EditSinglePatient(this.patient, {Key? key}) : super(key: key);

  Map patient;

  @override
  State<EditSinglePatient> createState() => _EditSinglePatientState();
}

class _EditSinglePatientState extends State<EditSinglePatient> {
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

// void _updatePatient() {
//   setState(() {
//     print('*****');
//     // print(patient['attributes']['first_name']);
//     // patient['attributes']['first_name'];
//     print('+++++++++++++++++++++++++++++++');
//   });
//
// }
  initState() {
    super.initState();
    // _updatePatient();
    // print('kjwkejhrkwejrh');
    print(widget.patient['id']);
    firstNameController.text = widget.patient['attributes']['first_name'];
    // lastNameController.text = widget.patient['attributes']['last_name'];
    // numberController.text = widget.patient['attributes']['number'];
    // weightController.text = widget.patient['attributes']['weight'];
    // ageController.text = widget.patient['attributes']['age'];
    // _date.text = widget.patient['attributes']['date'];
    // transfusionRequirementController.text = widget.patient['attributes']['transfusion_requirement'];
    // meanHbController.text = widget.patient['attributes']['mean_hb'];
    // serumFerritinController.text = widget.patient['attributes']['serrumferritin'];



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
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
              // TextFormField(
              //   controller: _controllerTitle,
              // ),
              // TextFormField(
              //   controller: _controllerBody,
              //   maxLines: 5,
              // ),
              ElevatedButton(
                  onPressed: () async {

                    Map<String, String> dataToUpdate = {
                      'first_name': firstNameController.text,
                      'last_name': lastNameController.text,
                      'number': numberController.text,
                      'age': ageController.text,
                      'weight': weightController.text,
                      'transfusion_requirement': transfusionRequirementController.text,
                      'date': _date.text,
                      'mean_hb': meanHbController.text,
                      'serrum_ferritin': serumFerritinController.text,

                    };

                    bool status = await HTTPHelper()
                        .updateItem(dataToUpdate, widget.patient['id'].toString());
                    // print(status);
                    if (status) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Patient updated')));
                      setState(() {

                      //   print(widget.patient['attributes']['first_name'] = firstNameController.text);
                        widget.patient['attributes']['first_name'] = firstNameController.text;
                      //   widget.patient['attributes']['last_name'] = lastNameController.text;
                      //   widget.patient['attributes']['number'] = numberController.text;
                      //   widget.patient['attributes']['weight'] = weightController.text;
                      //   widget.patient['attributes']['age'] = ageController.text;
                      //   widget.patient['attributes']['date'] = _date.text;
                      //   widget.patient['attributes']['transfusion_requirement'] = transfusionRequirementController.text;
                      //   widget.patient['attributes']['mean_hb'] = meanHbController.text;
                      //   widget.patient['attributes']['serrum_ferritin'] = serumFerritinController.text;
                      //
                      //
                      //
                      });
                    }
                    else
                    {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Failed to update the patient')));
                    }
                    Navigator.pop(context);
                    setState(() {
                      setState(() async {
                        await Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PatientLists()));
                      });
                    });
                  },

                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
