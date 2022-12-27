// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.data,
  });

  String? status;
  List<Datum>? data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.brand,
    this.image,
    this.price,
    this.description,
  });

  int? id;
  String? name;
  String? brand;
  String? image;
  String? price;
  String? description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    brand: json["brand"],
    image: json["image"],
    price: json["price"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand": brand,
    "image": image,
    "price": price,
    "description": description,
  };
}
