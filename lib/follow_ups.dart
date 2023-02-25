import 'package:flutter/material.dart';
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
  TextEditingController thalidomideMissedController = TextEditingController();
  TextEditingController sideEffectsController = TextEditingController();
  TextEditingController remarksController = TextEditingController();
  TextEditingController dateController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Follow aUps'),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextField(
                controller: updatedWeightController,
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
                decoration: const InputDecoration(
                    hintText: 'Hab',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(10)
                        )
                    )
                ),
              ),
              ElevatedButton(onPressed: () async{
                Map<String, dynamic> followUpData = {
                  'patient[weight]' : updatedWeightController.text,
                  'patient[hb]' : updatedHbController.text,
                };

                bool status = await HTTPHelper().addFollowup(followUpData, widget.patient['id'].toString());
                print(followUpData);
                if (status) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Followup Added')));

                }
                else
                {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Failed to update the patient')));
                }
                Navigator.pop(context);
                    await Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ShowFollowUps(widget.patient['id'])));

              }
              , child: Text('Submit'),)

            ],
          ),
        ),
      ),
    );
  }
}
