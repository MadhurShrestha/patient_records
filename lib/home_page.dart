import 'package:patient_records/patients.dart';
import 'package:flutter/material.dart';
import 'package:patient_records/patients_list.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  void clearText() {
    firstNameController.clear();
    lastNameController.clear();
    numberController.clear();
    ageController.clear();
    weightController.clear();
    _date.clear();
    transfusionRequirementController.clear();
    meanHbController.clear();
    serumFerritinController.clear();
  }

  List<Patient> patients = List.empty(growable: true);

  int selectedIndex = -1;
  String? gender; //no radio button will be selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Patients Records'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text("Gender",
            //  ),
            // ListTile(
            //
            //   title: Text("Male"),
            //   leading: Radio(
            //     value: "male",
            //     groupValue: gender,
            //     onChanged: (value){
            //       setState(() {
            //         gender = value.toString();
            //       });
            //     },
            //   ),
            // ),
            // ListTile(
            //   title: Text("Female"),
            //   leading: Radio(
            //     value: "female",
            //     groupValue: gender,
            //     onChanged: (value){
            //       setState(() {
            //         gender = value.toString();
            //       });
            //     },
            //   ),
            // ),

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      //
                      String firstName = firstNameController.text.trim();
                      String lastName = lastNameController.text.trim();
                      String age = ageController.text.trim();
                      String weight = weightController.text.trim();
                      String transfusionRequirement =
                          transfusionRequirementController.text.trim();
                      String meanHb = meanHbController.text.trim();
                      String number = numberController.text.trim();
                      if (firstName.isNotEmpty && number.isNotEmpty) {
                        setState(() {
                          patients.add(Patient(
                              firstName: firstName,
                              lastName: lastName,
                              number: number));

                          firstNameController.text = '';
                          lastNameController.text = '';
                          numberController.text = '';
                          weightController.text = '';
                          ageController.text = '';
                          transfusionRequirementController.text = '';
                          _date.text = '';
                          meanHbController.text = '';
                          serumFerritinController.text = '';
                        });
                      }
                      //
                    },
                    child: const Text('Save')),
                ElevatedButton(
                  onPressed: clearText,
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  child: const Text('Clear'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PatientLists()));
                    },
                    child: const Text('Show Patients')),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) => getRow(index),
              ),
            )
          ],
        ),
      ),
    );
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
              patients[index].lastName[0],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(patients[index].number),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    firstNameController.text = patients[index].firstName;
                    lastNameController.text = patients[index].lastName;
                    ageController.text = patients[index].number;
                    transfusionRequirementController.text =
                        patients[index].number;
                    meanHbController.text = patients[index].number;
                    serumFerritinController.text = patients[index].number;
                    numberController.text = patients[index].number;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      patients.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
