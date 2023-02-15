// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.data,
    required this.jsonapi,
  });

  Data data;
  Jsonapi jsonapi;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    data: Data.fromJson(json["data"]),
    jsonapi: Jsonapi.fromJson(json["jsonapi"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "jsonapi": jsonapi.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.type,
    required this.attributes,
  });

  String id;
  String type;
  Attributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    type: json["type"],
    attributes: Attributes.fromJson(json["attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "attributes": attributes.toJson(),
  };
}

class Attributes {
  Attributes({
    required this.firstName,
    required this.lastName,
    this.age,
    this.weight,
    this.contactNumber,
    this.startDate,
    this.gender,
    this.meanHb,
    this.transfussionRequirement,
    this.serumFerritin,
  });

  String firstName;
  String lastName;
  dynamic age;
  dynamic weight;
  dynamic contactNumber;
  dynamic startDate;
  dynamic gender;
  dynamic meanHb;
  dynamic transfussionRequirement;
  dynamic serumFerritin;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    firstName: json["first_name"],
    lastName: json["last_name"],
    age: json["age"],
    weight: json["weight"],
    contactNumber: json["contact_number"],
    startDate: json["start_date"],
    gender: json["gender"],
    meanHb: json["mean_hb"],
    transfussionRequirement: json["transfussion_requirement"],
    serumFerritin: json["serum_ferritin"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "age": age,
    "weight": weight,
    "contact_number": contactNumber,
    "start_date": startDate,
    "gender": gender,
    "mean_hb": meanHb,
    "transfussion_requirement": transfussionRequirement,
    "serum_ferritin": serumFerritin,
  };
}

class Jsonapi {
  Jsonapi({
    required this.version,
  });

  String version;

  factory Jsonapi.fromJson(Map<String, dynamic> json) => Jsonapi(
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
  };
}
