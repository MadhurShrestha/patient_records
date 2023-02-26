import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:patient_records/patients_list.dart';
import 'package:patient_records/show_followups.dart';
import 'dart:convert';

import 'HTTPHelper.dart';


class FollowUps extends StatefulWidget {
   FollowUps(this.patient,{Key? key}) : super(key: key);


  Map patient;


  @override
  State<FollowUps> createState() => _FollowUpsState();
}

class _FollowUpsState extends State<FollowUps> {
  TextEditingController updatedWeightController = TextEditingController();
  TextEditingController updatedHbController = TextEditingController();
  TextEditingController updatedBloodTransfusionController = TextEditingController();
  TextEditingController hydroxyUreaController = TextEditingController();
  TextEditingController thalidomideController = TextEditingController();
  TextEditingController hydroxyUreaMissedController = TextEditingController();
  TextEditingController thalidomideMissedController = TextEditingController();
  TextEditingController sideEffectsController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add follow ups'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  controller: updatedBloodTransfusionController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Blood Transfusion',
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
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2500));

                    if (pickeddate != null) {
                      setState(() {
                        dateController.text = DateFormat('yyyy-mm-dd').format(pickeddate);
                      });
                    }
                  },
                ),
                SizedBox(height: 35),
                ElevatedButton(onPressed: () async{
                  Map<String, dynamic> followUpData = {
                    'follow_up[weight]' : updatedWeightController.text,
                    'follow_up[hb]' : updatedHbController.text,
                    'follow_up[blood_transfusion]' : updatedBloodTransfusionController.text,
                    'follow_up[hydroxyurea]' : hydroxyUreaController.text,
                    'follow_up[thalidomide]' : thalidomideController.text,
                    'follow_up[hydroxyurea_missed]' : hydroxyUreaMissedController.text,
                    'follow_up[thalidomide_missed]' : thalidomideMissedController.text,
                    'follow_up[side_effects]' : sideEffectsController.text,
                    'follow_up[remarks]' : remarksController.text,
                    'follow_up[date]' : dateController.text,

                  };

                  bool status = await HTTPHelper().addFollowup(followUpData, widget.patient['id']);
                  print(followUpData);
                  print(widget.patient);
                  print(status);
                  if (status) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Followup Added')));

                  }
                  else
                  {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Failed to add followup')));
                  }
                  setState(() {
                    Navigator.pop(context);

                  });

                }
                ,
                  child: Text('Submit'),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
