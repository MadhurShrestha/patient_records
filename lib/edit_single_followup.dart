import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  TextEditingController updatedBloodTransfusionController =
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
    remarksController.text = widget.patient['attributes']['remarks'];
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
                TextField(
                  controller: remarksController,
                  decoration: const InputDecoration(
                      hintText: 'Remarks',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ))),
                ),
                ElevatedButton(
                    onPressed: () async {
                      Map<String, String> dataToUpdate = {
                        'remarks': remarksController.text,
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
