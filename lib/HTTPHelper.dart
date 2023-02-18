import "dart:convert";

import "package:http/http.dart" as http;

class HTTPHelper {

  Future<Map> showPatients() async {
    Map patients = {};
    // bool status = false;
    // print(data);
    // print('+++++++++++++++++++==');
    //Add the item to the database, call the API
    http.Response response = await http
        .get(
        Uri.parse('https://record-keeper.fly.dev/api/patients'),);
    if(response.statusCode==200)
    {
      String jsonString = response.body;
      //Convert to List<Map>
      Map data = jsonDecode(jsonString);
      patients= data;    }


    print(response.statusCode);
    // print(response.body);

    // print(response.statusCode);
    return patients;
  }


  Future<bool> addPatient(Map<String, dynamic> data) async {
    bool status = false;
    // print(data);
    // print('+++++++++++++++++++==');
    //Add the item to the database, call the API
    http.Response response = await http
        .post(
        Uri.parse('https://record-keeper.fly.dev/api/patients'),
        body: data);
    if(response.statusCode==201)
    {
      status=response.body.isNotEmpty;
    }

    ;
    print(response.statusCode);
    // print(response.body);

    // print(response.statusCode);




    return status;
  }

  Future<bool> updateItem(Map data, String userId) async{

    bool status = false;

    //Add  the item to the database and call the API
    http.Response response = await http.put(Uri.parse('https://record-keeper.fly.dev/api/patients/$userId'),
        body: jsonEncode(data),
        headers: {
          'Content-type': 'application/json'
        }
    );

    if(response.statusCode == 200) {
      status = response.body.isNotEmpty;
    }
    //Update the item from the API
    return status;
  }

  Future<Map> getSinglePatient(userId) async{
  Map patient={};
  //get the item from the api
  http.Response response = await http.get(Uri.parse('https://record-keeper.fly.dev/api/patients/$userId'));

  if(response.statusCode == 200);
  {
    String jsonString = response.body;
    patient = jsonDecode(jsonString);
  }

  return patient;
  }

  Future<bool> deleteItem(String userId) async {
    bool status = false;

    //Delete the item from the Database
    http.Response response=await http.delete(Uri.parse('https://record-keeper.fly.dev/api/patients/$userId'),);
    print(response.statusCode);

    if(response.statusCode==204)
    {
      status=true;
    }

    return status;
  }
}
