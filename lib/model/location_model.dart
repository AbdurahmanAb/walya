import 'package:flutter/foundation.dart';

class LocationModel {
  List<Address>? address;
  LocationModel({this.address});

  LocationModel.fromJson(Map<String, dynamic> json) {
    if (json["response"] != null) {
      address = <Address>[];
      (json["response"] as List).forEach((element) {
        address!.add(Address.fromJson(element));
      });
    }
  }
}

class Address {
  int? id;
  String? zone;
  String? city;
  String? title;
  String? Lat;
  String? lng;
  String? street;
  Address(
      {this.Lat,
      this.city,
      this.id,
      this.street,
      this.title,
      this.lng,
      this.zone});

  Address.fromJson(Map<String, dynamic> json) {
    id = int.parse(json["id"]);
    zone = json["zone"];
    city = json["city"];
    title = json["title"];
    street = json["street"];
    Lat = json["lat"];
    lng = json["lng"];
  }
}
