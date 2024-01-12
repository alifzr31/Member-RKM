// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';
import 'package:equatable/equatable.dart';

Store storeFromJson(String str) => Store.fromJson(json.decode(str));

String storeToJson(Store data) => json.encode(data.toJson());

List<Store> listStoreFromJson(String str) =>
    List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String listStoreToJson(List<Store> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store extends Equatable {
  final String? code;
  final String? name;
  final String? address;
  final String? phone;
  final String? lat;
  final String? long;
  final String? typeCode;
  final String? distance;

  const Store({
    this.code,
    this.name,
    this.address,
    this.phone,
    this.lat,
    this.long,
    this.typeCode,
    this.distance,
  });

  @override
  List<Object?> get props => [
        code,
        name,
        address,
        phone,
        lat,
        long,
        typeCode,
        distance,
      ];

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        code: json["code"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        lat: json["lat"],
        long: json["long"],
        typeCode: json["type_code"],
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "address": address,
        "phone": phone,
        "lat": lat,
        "long": long,
        "type_code": typeCode,
        "distance": distance,
      };
}
