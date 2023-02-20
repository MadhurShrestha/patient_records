// import 'package:flutter/material.dart';
//
// import 'api_service.dart';
// import 'model/Attributes.dart';
// import 'model/PatientsModel.dart';
// import 'HTTPHelper.dart';
//
// class SearchUser extends SearchDelegate {
//   FetchUser _userList = getUserList();
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//             Navigator.pop(context);
//
//
//           },
//           icon: Icon(Icons.close))
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back_ios),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return FutureBuilder<List<Attributes>>(
//         future: _userList.getUserList(query: query),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           List<Attributes>? data = snapshot.data;
//           return ListView.builder(
//               itemCount: data?.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Row(
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: Colors.deepPurpleAccent,
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       SizedBox(width: 20),
//                       Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               '${data?[index].firstName}',
//                               style: TextStyle(
//                                   fontSize: 18, fontWeight: FontWeight.w600),
//                             ),
//                             SizedBox(height: 10),
//                             Text(
//                               '${data?[index].lastName}',
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ])
//                     ],
//                   ),
//                 );
//               });
//         });
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Center(
//       child: Text('Search Patients'),
//     );
//   }
//
//   static FetchUser getUserList() {
//     return getUserList();
//   }
// }