import 'dart:convert';

class TaskData {
  String id;
  String name;
  String description;
  String status;

  TaskData({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) => TaskData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
      );

  
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
      };
}

List<TaskData> TaskDataListFromJson(String str) =>
    List<TaskData>.from(json.decode(str).map((x) => TaskData.fromJson(x)));

String TaskDataListToJson(List<TaskData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
