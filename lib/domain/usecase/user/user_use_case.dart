import '../../models/task/gateway/task_gateway.dart';
import '../../models/task/task.dart';

class TaskUseCase {
  final TaskGateway taskGateway;

  TaskUseCase({required this.taskGateway});

   Future<List<Task>> getTask() {
    return taskGateway.getTask();
  }
}
