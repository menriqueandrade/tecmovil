import '../../models/task/gateway/task_gateway.dart';
import '../../models/task/task.dart';

class TaskUseCase {
  final TaskGateway taskGateway;

  TaskUseCase({required this.taskGateway});

  Future<List<Task>> getTask() {
    return taskGateway.getTask();
  }

  Future<void> addTask(Task task) {
    return taskGateway.addTask(task);
  }

  Future<void> updateTask(String id, Task task) {
    return taskGateway.updateTask(id, task);
  }

  Future<void> deleteTask(String id) {
    return taskGateway.deleteTask(id);
  }
}
