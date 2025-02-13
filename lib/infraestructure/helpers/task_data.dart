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

  // Método para convertir un JSON en un objeto TaskData
  factory TaskData.fromJson(Map<String, dynamic> json) => TaskData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        status: json["status"],
      );

  // Método para convertir un objeto TaskData a JSON
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "status": status,
      };
}

// Método para convertir una lista de JSON a una lista de tareas
List<TaskData> TaskDataListFromJson(String str) =>
    List<TaskData>.from(json.decode(str).map((x) => TaskData.fromJson(x)));

String TaskDataListToJson(List<TaskData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
