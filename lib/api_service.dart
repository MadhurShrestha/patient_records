//for search feature
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import 'model/Attributes.dart';
// List? listResponse;
//
// class FetchUser{
//   var data = [];
//   List<Attributes> results = [];
//   String fetchUrl = "https://record-keeper.fly.dev/api/patients";
//   Future<List<Attributes>> getUserList({String? query}) async{
//     var url = Uri.parse(fetchUrl);
//     var response = await http.get(url);
//
//     try {
//       if (response.statusCode == 200) {
//         data = json.decode(response.body);
//         listResponse = json.decode(response.body)['data'];
//
//         // results = data.map((e) => Userlist.fromJson(e)).toList();
//         if (query!= null){
//           results = results.where((element) => element.firstName!.toLowerCase().contains((query.toLowerCase()))).toList();
//         }
//
//       } else {
//         print('api error');
//       }
//     } on Exception catch (e) {
//       print('error: $e');
//     }
//     return results;
//
//
//   }
// }