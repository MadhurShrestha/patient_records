class Attributes {
  Attributes({
      this.firstName, 
      this.lastName, 
      this.age, 
      this.weight, 
      this.contactNumber, 
      this.startDate, 
      this.gender, 
      this.meanHb, 
      this.transfussionRequirement, 
      this.serumFerritin,});

  Attributes.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    age = json['age'];
    weight = json['weight'];
    contactNumber = json['contact_number'];
    startDate = json['start_date'];
    gender = json['gender'];
    meanHb = json['mean_hb'];
    transfussionRequirement = json['transfussion_requirement'];
    serumFerritin = json['serum_ferritin'];
  }
  String? firstName;
  String? lastName;
  dynamic age;
  dynamic weight;
  dynamic contactNumber;
  dynamic startDate;
  dynamic gender;
  dynamic meanHb;
  dynamic transfussionRequirement;
  dynamic serumFerritin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['age'] = age;
    map['weight'] = weight;
    map['contact_number'] = contactNumber;
    map['start_date'] = startDate;
    map['gender'] = gender;
    map['mean_hb'] = meanHb;
    map['transfussion_requirement'] = transfussionRequirement;
    map['serum_ferritin'] = serumFerritin;
    return map;
  }

}