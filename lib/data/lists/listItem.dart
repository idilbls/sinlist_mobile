import 'dart:convert';

class List {
  List({
    this.id,
    this.name,
    this.description,
    this.count,
    this.isActive,
    this.creationTime,
    this.listId
  });

  int id;
  String name;
  String description;
  int count;
  bool isActive;
  DateTime creationTime;
  int listId;


  factory List.fromJson(Map<String, dynamic> json) => List(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      count: json["count"],
      isActive: json["isActive"],
      creationTime: json["creationTime"],
      listId: json["listId"]);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "count": count,
    "isActive": isActive,
    "creationTime": creationTime,
    "listId": listId
  };
}
