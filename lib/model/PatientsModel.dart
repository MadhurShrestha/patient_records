/// data : [{"id":"85","type":"patient","attributes":{"first_name":"Dsg","last_name":"Cvb","age":null,"weight":null,"contact_number":null,"start_date":null,"gender":"female","mean_hb":null,"transfussion_requirement":null,"serum_ferritin":null,"updated_at":"2023-02-19T19:24:58.808Z"},"relationships":{"follow_ups":{"meta":{"included":false}}}},{"id":"84","type":"patient","attributes":{"first_name":"Shibon","last_name":"","age":null,"weight":null,"contact_number":null,"start_date":null,"gender":null,"mean_hb":null,"transfussion_requirement":null,"serum_ferritin":null,"updated_at":"2023-02-19T06:54:44.194Z"},"relationships":{"follow_ups":{"meta":{"included":false}}}},{"id":"83","type":"patient","attributes":{"first_name":"Rivea","last_name":"","age":null,"weight":null,"contact_number":null,"start_date":null,"gender":null,"mean_hb":null,"transfussion_requirement":null,"serum_ferritin":null,"updated_at":"2023-02-19T06:53:44.462Z"},"relationships":{"follow_ups":{"meta":{"included":false}}}},{"id":"82","type":"patient","attributes":{"first_name":"Roman","last_name":"","age":null,"weight":null,"contact_number":null,"start_date":null,"gender":null,"mean_hb":null,"transfussion_requirement":null,"serum_ferritin":null,"updated_at":"2023-02-19T06:53:18.957Z"},"relationships":{"follow_ups":{"meta":{"included":false}}}},{"id":"81","type":"patient","attributes":{"first_name":"Harip Kto Moh","last_name":"","age":null,"weight":null,"contact_number":null,"start_date":null,"gender":null,"mean_hb":null,"transfussion_requirement":null,"serum_ferritin":null,"updated_at":"2023-02-19T06:36:10.207Z"},"relationships":{"follow_ups":{"meta":{"included":false}}}},{"id":"79","type":"patient","attributes":{"first_name":"Maya Higa GIga","last_name":"","age":null,"weight":null,"contact_number":null,"start_date":null,"gender":null,"mean_hb":null,"transfussion_requirement":null,"serum_ferritin":null,"updated_at":"2023-02-19T06:30:54.535Z"},"relationships":{"follow_ups":{"meta":{"included":false}}}},{"id":"80","type":"patient","attributes":{"first_name":"Lotion","last_name":"","age":null,"weight":null,"contact_number":null,"start_date":null,"gender":null,"mean_hb":null,"transfussion_requirement":null,"serum_ferritin":null,"updated_at":"2023-02-19T06:30:15.961Z"},"relationships":{"follow_ups":{"meta":{"included":false}}}}]
/// jsonapi : {"version":"1.0"}

class PatientsModel {
  PatientsModel({
    List<Data>? data,
    Jsonapi? jsonapi,}){
    _data = data;
    _jsonapi = jsonapi;
  }

  PatientsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _jsonapi = json['jsonapi'] != null ? Jsonapi.fromJson(json['jsonapi']) : null;
  }
  List<Data>? _data;
  Jsonapi? _jsonapi;
  PatientsModel copyWith({  List<Data>? data,
    Jsonapi? jsonapi,
  }) => PatientsModel(  data: data ?? _data,
    jsonapi: jsonapi ?? _jsonapi,
  );
  List<Data>? get data => _data;
  Jsonapi? get jsonapi => _jsonapi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_jsonapi != null) {
      map['jsonapi'] = _jsonapi?.toJson();
    }
    return map;
  }

}

/// version : "1.0"

class Jsonapi {
  Jsonapi({
    String? version,}){
    _version = version;
  }

  Jsonapi.fromJson(dynamic json) {
    _version = json['version'];
  }
  String? _version;
  Jsonapi copyWith({  String? version,
  }) => Jsonapi(  version: version ?? _version,
  );
  String? get version => _version;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = _version;
    return map;
  }

}

/// id : "85"
/// type : "patient"
/// attributes : {"first_name":"Dsg","last_name":"Cvb","age":null,"weight":null,"contact_number":null,"start_date":null,"gender":"female","mean_hb":null,"transfussion_requirement":null,"serum_ferritin":null,"updated_at":"2023-02-19T19:24:58.808Z"}
/// relationships : {"follow_ups":{"meta":{"included":false}}}

class Data {
  Data({
    String? id,
    String? type,
    Attributes? attributes,
    Relationships? relationships,}){
    _id = id;
    _type = type;
    _attributes = attributes;
    _relationships = relationships;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _type = json['type'];
    _attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
    _relationships = json['relationships'] != null ? Relationships.fromJson(json['relationships']) : null;
  }
  String? _id;
  String? _type;
  Attributes? _attributes;
  Relationships? _relationships;
  Data copyWith({  String? id,
    String? type,
    Attributes? attributes,
    Relationships? relationships,
  }) => Data(  id: id ?? _id,
    type: type ?? _type,
    attributes: attributes ?? _attributes,
    relationships: relationships ?? _relationships,
  );
  String? get id => _id;
  String? get type => _type;
  Attributes? get attributes => _attributes;
  Relationships? get relationships => _relationships;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['type'] = _type;
    if (_attributes != null) {
      map['attributes'] = _attributes?.toJson();
    }
    if (_relationships != null) {
      map['relationships'] = _relationships?.toJson();
    }
    return map;
  }

}

/// follow_ups : {"meta":{"included":false}}

class Relationships {
  Relationships({
    FollowUps? followUps,}){
    _followUps = followUps;
  }

  Relationships.fromJson(dynamic json) {
    _followUps = json['follow_ups'] != null ? FollowUps.fromJson(json['follow_ups']) : null;
  }
  FollowUps? _followUps;
  Relationships copyWith({  FollowUps? followUps,
  }) => Relationships(  followUps: followUps ?? _followUps,
  );
  FollowUps? get followUps => _followUps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_followUps != null) {
      map['follow_ups'] = _followUps?.toJson();
    }
    return map;
  }

}

/// meta : {"included":false}

class FollowUps {
  FollowUps({
    Meta? meta,}){
    _meta = meta;
  }

  FollowUps.fromJson(dynamic json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  Meta? _meta;
  FollowUps copyWith({  Meta? meta,
  }) => FollowUps(  meta: meta ?? _meta,
  );
  Meta? get meta => _meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_meta != null) {
      map['meta'] = _meta?.toJson();
    }
    return map;
  }

}

/// included : false

class Meta {
  Meta({
    bool? included,}){
    _included = included;
  }

  Meta.fromJson(dynamic json) {
    _included = json['included'];
  }
  bool? _included;
  Meta copyWith({  bool? included,
  }) => Meta(  included: included ?? _included,
  );
  bool? get included => _included;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['included'] = _included;
    return map;
  }

}

/// first_name : "Dsg"
/// last_name : "Cvb"
/// age : null
/// weight : null
/// contact_number : null
/// start_date : null
/// gender : "female"
/// mean_hb : null
/// transfussion_requirement : null
/// serum_ferritin : null
/// updated_at : "2023-02-19T19:24:58.808Z"

class Attributes {
  Attributes({
    String? firstName,
    String? lastName,
    dynamic age,
    dynamic weight,
    dynamic contactNumber,
    dynamic startDate,
    String? gender,
    dynamic meanHb,
    dynamic transfussionRequirement,
    dynamic serumFerritin,
    String? updatedAt,}){
    _firstName = firstName;
    _lastName = lastName;
    _age = age;
    _weight = weight;
    _contactNumber = contactNumber;
    _startDate = startDate;
    _gender = gender;
    _meanHb = meanHb;
    _transfussionRequirement = transfussionRequirement;
    _serumFerritin = serumFerritin;
    _updatedAt = updatedAt;
  }

  Attributes.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _age = json['age'];
    _weight = json['weight'];
    _contactNumber = json['contact_number'];
    _startDate = json['start_date'];
    _gender = json['gender'];
    _meanHb = json['mean_hb'];
    _transfussionRequirement = json['transfussion_requirement'];
    _serumFerritin = json['serum_ferritin'];
    _updatedAt = json['updated_at'];
  }
  String? _firstName;
  String? _lastName;
  dynamic _age;
  dynamic _weight;
  dynamic _contactNumber;
  dynamic _startDate;
  String? _gender;
  dynamic _meanHb;
  dynamic _transfussionRequirement;
  dynamic _serumFerritin;
  String? _updatedAt;
  Attributes copyWith({  String? firstName,
    String? lastName,
    dynamic age,
    dynamic weight,
    dynamic contactNumber,
    dynamic startDate,
    String? gender,
    dynamic meanHb,
    dynamic transfussionRequirement,
    dynamic serumFerritin,
    String? updatedAt,
  }) => Attributes(  firstName: firstName ?? _firstName,
    lastName: lastName ?? _lastName,
    age: age ?? _age,
    weight: weight ?? _weight,
    contactNumber: contactNumber ?? _contactNumber,
    startDate: startDate ?? _startDate,
    gender: gender ?? _gender,
    meanHb: meanHb ?? _meanHb,
    transfussionRequirement: transfussionRequirement ?? _transfussionRequirement,
    serumFerritin: serumFerritin ?? _serumFerritin,
    updatedAt: updatedAt ?? _updatedAt,
  );
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  dynamic get age => _age;
  dynamic get weight => _weight;
  dynamic get contactNumber => _contactNumber;
  dynamic get startDate => _startDate;
  String? get gender => _gender;
  dynamic get meanHb => _meanHb;
  dynamic get transfussionRequirement => _transfussionRequirement;
  dynamic get serumFerritin => _serumFerritin;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['age'] = _age;
    map['weight'] = _weight;
    map['contact_number'] = _contactNumber;
    map['start_date'] = _startDate;
    map['gender'] = _gender;
    map['mean_hb'] = _meanHb;
    map['transfussion_requirement'] = _transfussionRequirement;
    map['serum_ferritin'] = _serumFerritin;
    map['updated_at'] = _updatedAt;
    return map;
  }

}