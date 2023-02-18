//
// class EditPatient extends StatelessWidget {
//   EditPatient(this.userId, {Key? key}) : super(key: key) {
//     _futurePatient = HTTPHelper().getSinglePatient(userId);
//   }
//   String userId;
//   late Future<Map> _futurePatient;
//   late Map patient;
//
//   void updatePatientRecords() {
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _loadData();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Details'),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (_) => EditSinglePatient(patient)));
//               },
//               icon: Icon(Icons.edit)),
//           IconButton(
//               onPressed: () async {
//                 //Delete
//                 bool deleted = await HTTPHelper().deleteItem(userId);
//                 print(deleted);
//                 print(userId);
//                 print('+++++++++');
//                 if (deleted) {
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text('Patient deleted')));
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Failed to delete')));
//                 }
//               },
//               icon: Icon(Icons.delete)),
//         ],
//       ),
//       body: FutureBuilder<Map>(
//         future: _futurePatient,
//         builder: (context, snapshot) {
//           // print(snapshot.hasError);
//           if (snapshot.hasError) {
//             return Text('Some error  ${snapshot.error}');
//           }
//
//           if (snapshot.hasData) {
//             patient = snapshot.data!['data'];
//             // print(patient);
//
//             return Column(
//
//               children: [
//
//                 Text(
//                   '${patient['id']}',
//                   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 20),
//                 ),
//                 Text(
//                   '${patient['attributes']['first_name']}',
//                 )
//               ],
//             );
//           }
//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
