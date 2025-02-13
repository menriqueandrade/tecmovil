import 'package:dcsas/domain/models/task/gateway/task_gateway.dart';
import 'package:dcsas/domain/models/task/task.dart';


class TaskFake extends TaskGateway {
  @override
  Future<List<Task>> getTask() async {
    await Future.delayed(Duration(seconds: 1)); // Simula un delay de API

    return [
      Task(id: '1', name: 'Comprar pan', description: 'Ir a la tienda', status: 'pending'),
      Task(id: '2', name: 'Hacer ejercicio', description: 'Correr 5km', status: 'completed'),
      Task(id: '3', name: 'Leer un libro', description: 'Terminar capítulo 3', status: 'pending'),
    ];
  }
  
  
  
}
