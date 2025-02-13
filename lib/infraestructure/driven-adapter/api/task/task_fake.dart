import 'package:dcsas/domain/models/task/gateway/task_gateway.dart';
import 'package:dcsas/domain/models/task/task.dart';


class TaskFake extends TaskGateway {
  @override
  Future<List<Task>> getTask() async {
 

    return [
      Task(id: '1', name: 'Comprar pan', description: 'Ir a la tienda', status: 'pending'),
      Task(id: '2', name: 'Hacer ejercicio', description: 'Correr 5km', status: 'completed'),
      Task(id: '3', name: 'Leer un libro', description: 'Terminar capítulo 3', status: 'pending'),
      Task(id: '4', name: 'xr un libro', description: 'Terminar capítulo 56', status: 'in progress'),
      Task(id: '5', name: '5 un libro', description: 'Terminar capítulo 56', status: 'paused'),
      Task(id: '6', name: '6 un libro', description: 'Terminar capítulo 56', status: 'cancelled'),


    ];
  }
  
  
  
}
