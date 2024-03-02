// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile extends Equatable {
  final String? username;
  final String? emailUser;
  final String? phoneUser;
  final String? verify;
  final String? image;
  final String? code;
  final String? name;
  final String? category;
  final String? idType;
  final String? idNumber;
  final String? gender;
  final DateTime? birthDate;
  final String? birthPlace;
  final String? street;
  final dynamic village;
  final dynamic district;
  final dynamic city;
  final dynamic province;
  final dynamic postalCode;
  final String? job;
  final String? religion;
  final String? maritalStatus;
  final String? lastEducation;
  final DateTime? joinedDate;
  final String? point;
  final int? totalSpending;
  final dynamic lastTransaction;
  final String? status;
  final AddOn? addOn;

  const Profile({
    this.username,
    this.emailUser,
    this.phoneUser,
    this.verify,
    this.image,
    this.code,
    this.name,
    this.category,
    this.idType,
    this.idNumber,
    this.gender,
    this.birthDate,
    this.birthPlace,
    this.street,
    this.village,
    this.district,
    this.city,
    this.province,
    this.postalCode,
    this.job,
    this.religion,
    this.maritalStatus,
    this.lastEducation,
    this.joinedDate,
    this.point,
    this.totalSpending,
    this.lastTransaction,
    this.status,
    this.addOn,
  });

  @override
  List<Object?> get props => [
        username,
        emailUser,
        phoneUser,
        verify,
        image,
        code,
        name,
        category,
        idType,
        idNumber,
        gender,
        birthDate,
        birthPlace,
        street,
        village,
        district,
        city,
        province,
        postalCode,
        job,
        religion,
        maritalStatus,
        lastEducation,
        joinedDate,
        point,
        totalSpending,
        lastTransaction,
        status,
        addOn,
      ];

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        username: json["username"],
        emailUser: json["email_user"],
        phoneUser: json["phone_user"],
        verify: json["verify"],
        image: json["image"],
        code: json["code"],
        name: json["name"],
        category: json["category"],
        idType: json["id_type"],
        idNumber: json["id_number"],
        gender: json["gender"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        birthPlace: json["birth_place"],
        street: json["street"],
        village: json["village"],
        district: json["district"],
        city: json["city"],
        province: json["province"],
        postalCode: json["postal_code"],
        job: json["job"],
        religion: json["religion"],
        maritalStatus: json["marital_status"],
        lastEducation: json["last_education"],
        joinedDate: json["joined_date"] == null
            ? null
            : DateTime.parse(json["joined_date"]),
        point: json["point"],
        totalSpending: json["total_spending"] == null
            ? null
            : int.parse(json["total_spending"]),
        lastTransaction: json["last_transaction"],
        status: json["status"],
        addOn: json["marker"] == null ? null : AddOn.fromJson(json["marker"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email_user": emailUser,
        "phone_user": phoneUser,
        "verify": verify,
        "image": image,
        "code": code,
        "name": name,
        "category": category,
        "id_type": idType,
        "id_number": idNumber,
        "gender": gender,
        "birth_date": birthDate,
        "birth_place": birthPlace,
        "street": street,
        "village": village,
        "district": district,
        "city": city,
        "province": province,
        "postal_code": postalCode,
        "job": job,
        "religion": religion,
        "marital_status": maritalStatus,
        "last_education": lastEducation,
        "joined_date": joinedDate?.toIso8601String(),
        "point": point,
        "total_spending": totalSpending,
        "last_transaction": lastTransaction,
        "status": status,
        "marker": addOn?.toJson(),
      };
}

class AddOn extends Equatable {
  final bool? hasPin;
  final bool? complete;
  final dynamic villageId;
  final int? voucherTotal;

  const AddOn({
    this.hasPin,
    this.complete,
    this.villageId,
    this.voucherTotal,
  });

  @override
  List<Object?> get props => [
        hasPin,
        complete,
        villageId,
        voucherTotal,
      ];

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
        hasPin: json["has_pin"],
        complete: json["complete"],
        villageId: json["village_id"],
        voucherTotal: json["voucher_total"],
      );

  Map<String, dynamic> toJson() => {
        "has_pin": hasPin,
        "complete": complete,
        "village_id": villageId,
        "voucher_total": voucherTotal,
      };
}
