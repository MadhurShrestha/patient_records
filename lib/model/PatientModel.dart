import 'Data.dart';
import 'Jsonapi.dart';

class PatientModel {
  PatientModel({
      this.data, 
      this.jsonapi,});

  PatientModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    jsonapi = json['jsonapi'] != null ? Jsonapi.fromJson(json['jsonapi']) : null;
  }
  Data? data;
  Jsonapi? jsonapi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.toJson();
    }
    if (jsonapi != null) {
      map['jsonapi'] = jsonapi!.toJson();
    }
    return map;
  }

}