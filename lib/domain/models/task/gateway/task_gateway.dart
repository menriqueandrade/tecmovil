import 'package:dcsas/domain/models/task/task.dart';

abstract class TaskGateway {
  Future<List<Task>> getTask();
  Future<void> addTask(Task task);
  Future<void> updateTask(String id, Task task);
  Future<void> deleteTask(String id);
}
