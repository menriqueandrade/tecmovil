import 'package:dcsas/domain/models/task/task.dart';

abstract class TaskGateway {
   Future<List<Task>> getTask();
}
