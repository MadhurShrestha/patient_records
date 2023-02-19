class Jsonapi {
  Jsonapi({
      this.version,});

  Jsonapi.fromJson(dynamic json) {
    version = json['version'];
  }
  String? version;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version'] = version;
    return map;
  }

}