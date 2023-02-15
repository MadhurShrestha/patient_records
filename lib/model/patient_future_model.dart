// To parse this JSON data, do
//
//     final patientRecords = patientRecordsFromJson(jsonString);

import 'dart:convert';

PatientRecords patientRecordsFromJson(String str) => PatientRecords.fromJson(json.decode(str));

String patientRecordsToJson(PatientRecords data) => json.encode(data.toJson());

class PatientRecords {
  PatientRecords({
    required this.data,
    required this.jsonapi,
  });

  List<Datum> data;
  Jsonapi jsonapi;

  factory PatientRecords.fromJson(Map<String, dynamic> json) => PatientRecords(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    jsonapi: Jsonapi.fromJson(json["jsonapi"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "jsonapi": jsonapi.toJson(),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.type,
    required this.attributes,
  });

  String id;
  String type;
  Attributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
  int? weight;
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
