import 'Attributes.dart';

class Data {
  Data({
      this.id, 
      this.type, 
      this.attributes,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null;
  }
  String? id;
  String? type;
  Attributes? attributes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    if (attributes != null) {
      map['attributes'] = attributes!.toJson();
    }
    return map;
  }

}