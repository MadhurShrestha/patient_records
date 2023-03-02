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
  TextEditingController genderController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController transfussionRequirementController =
  TextEditingController();
  TextEditingController meanHbController = TextEditingController();
  TextEditingController serumFerritinController = TextEditingController();
  final fieldText = TextEditingController();

  initState() {
    super.initState();
    // _updatePatient();
    // print('kjwkejhrkwejrh');
    print(widget.patient['id']);
    firstNameController.text = widget.patient['attributes']['first_name'];
    lastNameController.text = widget.patient['attributes']['last_name'];
    // genderController.text = widget.patient['attributes']['gender'].toString();

    // lastNameController.text = widget.patient['attributes']['last_name'];
    numberController.text = widget.patient['attributes']['contact_number'].toString();
    weightController.text = widget.patient['attributes']['weight'].toString();
    ageController.text = widget.patient['attributes']['age'].toString();
    dateController.text = widget.patient['attributes']['start_date'].toString();
    transfussionRequirementController.text = widget.patient['attributes']['transfussion_requirement'].toString();
    meanHbController.text = widget.patient['attributes']['mean_hb'].toString();
    serumFerritinController.text = widget.patient['attributes']['serum_ferritin'].toString();

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
                // TextField(
                //   controller: genderController,
                //   decoration: const InputDecoration(
                //       hintText: 'Last Name',
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(10),
                //           ))),
                // ),
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
                      hintText: 'transfussion Requirement',
                      counter: SizedBox.shrink(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ))),
                ),
                TextField(
                  controller: dateController,
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
                        // 'gender': genderController.text,
                        'contact_number': numberController.text,
                        'age': ageController.text,
                        'weight': weightController.text,
                        'transfussion_requirement': transfussionRequirementController.text,
                        'start_date': dateController.text,
                        'mean_hb': meanHbController.text,
                        'serum_ferritin': serumFerritinController.text,

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
                          widget.patient['attributes']['last_name'] = lastNameController.text;
                          widget.patient['attributes']['gender'] = genderController.text;


                          //   widget.patient['attributes']['last_name'] = lastNameController.text;
                          widget.patient['attributes']['contact_number'] = numberController.text;
                          widget.patient['attributes']['weight'] = weightController.text;
                          widget.patient['attributes']['age'] = ageController.text;
                          widget.patient['attributes']['start_date'] = dateController.text;
                          widget.patient['attributes']['transfussion_requirement'] = transfussionRequirementController.text;
                          widget.patient['attributes']['mean_hb'] = meanHbController.text;
                          widget.patient['attributes']['serum_ferritin'] = serumFerritinController.text;
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
      ),
    );
  }
}
