import 'dart:convert';

class Car {
  int? id;
  String? name;
  String? kind;
  String? urlPhoto;

  Car({this.id, this.name, this.kind, this.urlPhoto});

  Car.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        kind = json['kind'],
        urlPhoto = json['urlPhoto'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['id'] = this.id;
    data['name'] = this.name;
    data['kind'] = this.kind;
    data['urlPhoto'] = this.urlPhoto;
    return data;
  }
}
