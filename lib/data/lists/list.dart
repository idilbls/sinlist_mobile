import 'dart:convert';

class List {
  List({
    this.id,
    this.name,
    this.isActive,
    this.creationTime
  });

  int id;
  String name;
  bool isActive;
  DateTime creationTime;


  factory List.fromJson(Map<String, dynamic> json) => List(
      id: json["id"],
      name: json["name"],
      isActive: json["isActive"],
      creationTime: json["creationTime"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isActive": isActive,
    "creationTime": creationTime
  };
}
