//Entidad de definicion de los DATOS
class Task {
  String? id; 
  String name;
  String description;
  String status;

  Task({
    this.id, 
    required this.name,
    required this.description,
    required this.status,
  });
}
