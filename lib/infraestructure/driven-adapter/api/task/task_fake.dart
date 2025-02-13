import 'package:dcsas/domain/models/task/gateway/task_gateway.dart';
import 'package:dcsas/domain/models/task/task.dart';

class TaskFake extends TaskGateway {
  final List<Task> _tasks = [
    Task(
        id: '1',
        name: 'Comprar pan',
        description: 'Ir a la tienda',
        status: 'pending'),
    Task(
        id: '2',
        name: 'Hacer ejercicio',
        description: 'Correr 5km',
        status: 'completed'),
    Task(
        id: '3',
        name: 'Leer un libro',
        description: 'Terminar capítulo 3',
        status: 'pending'),
    Task(
        id: '4',
        name: 'Estudiar Flutter',
        description: 'Ver curso online',
        status: 'in progress'),
    Task(
        id: '5',
        name: 'Hacer una pausa',
        description: 'Descansar 15 min',
        status: 'paused'),
    Task(
        id: '6',
        name: 'Cancelar suscripción',
        description: 'Dar de baja un servicio',
        status: 'cancelled'),
  ];

  @override
  Future<List<Task>> getTask() async {
    return Future.value(_tasks);
  }

  @override
  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }

  @override
  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
  }

  @override
  Future<void> updateTask(String id, Task task) async {
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks[index] = task;
    }
  }
}
