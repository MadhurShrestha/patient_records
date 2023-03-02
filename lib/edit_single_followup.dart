import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:patient_records/show_followups.dart';
import 'dart:convert';

import 'HTTPHelper.dart';

class EditSingleFollowup extends StatefulWidget {
  EditSingleFollowup(this.patient, {Key? key}) : super(key: key);

  Map patient;

  @override
  State<EditSingleFollowup> createState() => _EditSingleFollowupState();
}

class _EditSingleFollowupState extends State<EditSingleFollowup> {
  TextEditingController updatedWeightController = TextEditingController();
  TextEditingController updatedHbController = TextEditingController();
  TextEditingController updatedBloodtransfussionController =
      TextEditingController();
  TextEditingController hydroxyUreaController = TextEditingController();
  TextEditingController thalidomideController = TextEditingController();
  TextEditingController hydroxyUreaMissedController = TextEditingController();
  TextEditingController thalidomideMissedController = TextEditingController();
  TextEditingController sideEffectsController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    updatedWeightController.text = widget.patient['attributes']['weight'].toString();
    updatedHbController.text = widget.patient['attributes']['hb'].toString();
    updatedBloodtransfussionController.text = widget.patient['attributes']['blood_transfusion'].toString();
    hydroxyUreaController.text = widget.patient['attributes']['hydroxyurea'].toString();
    thalidomideController.text = widget.patient['attributes']['thalidomide'].toString();
    hydroxyUreaMissedController.text = widget.patient['attributes']['hydroxyurea_missed'].toString();
    thalidomideMissedController.text = widget.patient['attributes']['thalidomide_missed'].toString();
    sideEffectsController.text = widget.patient['attributes']['side_effects'];
    remarksController.text = widget.patient['attributes']['remarks'];
    dateController.text = widget.patient['attributes']['date'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Single Patient Record'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 5),
                TextField(
                  controller: updatedWeightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Weight',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: updatedHbController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Hb',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: updatedBloodtransfussionController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Blood transfussion',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),              SizedBox(height: 5),
                TextField(
                  controller: hydroxyUreaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Hydroxyurea',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),              SizedBox(height: 5),
                TextField(
                  controller: thalidomideController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Thalidomide',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),              SizedBox(height: 5),
                TextField(
                  controller: hydroxyUreaMissedController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Hydroxyurea Missed',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),              SizedBox(height: 5),
                TextField(
                  controller: thalidomideMissedController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Thalidomide Missed',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),              SizedBox(height: 5),
                TextField(
                  controller: sideEffectsController,
                  decoration: const InputDecoration(
                      hintText: 'Side Effects',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),              SizedBox(height: 5),
                TextField(
                  controller: remarksController,
                  decoration: const InputDecoration(
                      hintText: 'Remarks',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),
                TextField(
                  controller: remarksController,
                  decoration: const InputDecoration(
                      hintText: 'Remarks',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10)
                          )
                      )
                  ),
                ),
                SizedBox(height: 5),
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
                SizedBox(height: 5),
                ElevatedButton(
                    onPressed: () async {
                      Map<String, String> dataToUpdate = {
                        'weight': updatedWeightController.text,
                        'hb': updatedHbController.text,
                        'blood_transfusion': updatedBloodtransfussionController.text,
                        'hydroxyurea': hydroxyUreaController.text,
                        'thalidomide': thalidomideController.text,
                        'hydroxyurea_missed': hydroxyUreaMissedController.text,
                        'thalidomide_missed': thalidomideMissedController.text,
                        'side_effects': sideEffectsController.text,
                        'remarks': remarksController.text,
                        'date': dateController.text
                      };
                      bool status = await HTTPHelper().updateSingleFollowup(
                          dataToUpdate,
                          widget.patient['id'].toString(),
                          widget.patient['id']);
                      print('+++++++++');
                      print(widget.patient);
                      print('*********');

                      if (status) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Follow Up updated')));
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  ShowFollowUps(widget.patient['attributes']['patient_id'].toString())));
                          setState(() {

                          });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Follow Up updated failed')));
                      }
                        Navigator.pop(context);
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
