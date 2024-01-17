// To parse this JSON data, do
//
//     final detailShoppingHistory = detailShoppingHistoryFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

DetailShoppingHistory detailShoppingHistoryFromJson(String str) =>
    DetailShoppingHistory.fromJson(json.decode(str));

String detailShoppingHistoryToJson(DetailShoppingHistory data) =>
    json.encode(data.toJson());

List<DetailShoppingHistory> listDetailShoppingHistoryFromJson(String str) =>
    List<DetailShoppingHistory>.from(
        json.decode(str).map((x) => DetailShoppingHistory.fromJson(x)));

String listDetailShoppingHistoryToJson(List<DetailShoppingHistory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailShoppingHistory extends Equatable {
  final String? itemCode;
  final String? dscription;
  final String? qty;
  final int? harga;
  final int? subTotal;

  const DetailShoppingHistory({
    this.itemCode,
    this.dscription,
    this.qty,
    this.harga,
    this.subTotal,
  });

  @override
  List<Object?> get props => [
        itemCode,
        dscription,
        qty,
        harga,
        subTotal,
      ];

  factory DetailShoppingHistory.fromJson(Map<String, dynamic> json) =>
      DetailShoppingHistory(
        itemCode: json["ItemCode"],
        dscription: json["Dscription"],
        qty: json["Qty"],
        harga: json["Harga"] == null ? null : int.parse(json["Harga"]),
        subTotal: json["SubTotal"] == null ? null : int.parse(json["SubTotal"]),
      );

  Map<String, dynamic> toJson() => {
        "ItemCode": itemCode,
        "Dscription": dscription,
        "Qty": qty,
        "Harga": harga,
        "SubTotal": subTotal,
      };
}
