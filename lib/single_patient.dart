// import 'package:flutter/material.dart';
// import 'package:patient_records/edit_patient.dart';
// import 'package:patient_records/patients_list.dart';
// import 'patients_list.dart';
//
// import 'HTTPHelper.dart';
// // import 'edit_post.dart';
//
// class SinglePatient extends StatelessWidget {
//   SinglePatient(this.itemId, {Key? key}) : super(key: key) {
//     // _futurePost = HTTPHelper().fetchItems();
//
//   }
//
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController numberController = TextEditingController();
//   TextEditingController weightController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//   TextEditingController _date = TextEditingController();
//   TextEditingController transfusionRequirementController =
//   TextEditingController();
//   TextEditingController meanHbController = TextEditingController();
//   TextEditingController serumFerritinController = TextEditingController();
//   final fieldText = TextEditingController();
//
//   void clearText() {
//     firstNameController.clear();
//     lastNameController.clear();
//     numberController.clear();
//     ageController.clear();
//     weightController.clear();
//     _date.clear();
//     transfusionRequirementController.clear();
//     meanHbController.clear();
//     serumFerritinController.clear();
//   }
//
//   String itemId;
//   late Future<Map> _futurePost;
//   late Map post;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Details'),
//         actions: [
//           IconButton(onPressed: () {
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (_) => EditPatient()));
//           }, icon: Icon(Icons.edit)),
// ],
//       ),
//     body:         ListView.builder(itemBuilder: (context, index) {
//       return Column(
//         children: [
//           Text(listResponse![index]['attributes']['first_name'].toString()),],
//
//       );
//     },
//
//       //   body: FutureBuilder<Map>(
//     //     future: _futurePost,
//     //     builder: (context, snapshot) {
//     //       if (snapshot.hasError) {
//     //         return Center(child: Text('Some error occurred ${snapshot.error}'));
//     //       }
//     //
//     //       if (snapshot.hasData) {
//     //         post = snapshot.data!;
//     //
//     //         return Column(
//     //           children: [
//     //             Text(
//     //               '${post['title']}',
//     //               style: TextStyle(fontWeight: FontWeight.bold),
//     //             ),
//     //             Text('${post['body']}'),
//     //           ],
//     //         );
//     //       }
//     // //
//     //       return Center(child: CircularProgressIndicator());
//     //     },
//     //   ),
//     ));
//   }
// }