// To parse this JSON data, do
//
//     final dataPerson = dataPersonFromJson(jsonString);

import 'dart:convert';

DataPerson dataPersonFromJson(String str) =>
    DataPerson.fromJson(json.decode(str));

String dataPersonToJson(DataPerson data) => json.encode(
      data.toJson(),
    );

class DataPerson {
  DataPerson({
    required this.fullname,
    required this.age,
    required this.tall,
  });

  final dynamic fullname;
  final int age;
  final double tall;

  factory DataPerson.fromJson(Map<String, dynamic> json) => DataPerson(
        fullname: json["fullname"],
        age: json["age"],
        tall: json["tall"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "age": age,
        "tall": tall,
      };
}
