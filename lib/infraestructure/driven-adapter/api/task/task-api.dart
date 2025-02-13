import 'dart:convert';

import 'package:dcsas/domain/models/task/gateway/task_gateway.dart';
import 'package:dcsas/domain/models/task/task.dart';
import 'package:dcsas/infraestructure/helpers/task_data.dart';
import 'package:http/http.dart';

enum FetchUserError {
  notFound,
  serverError,
  unknown,
}

class FetchUserException implements Exception {
  final FetchUserError error;
  final String message;

  FetchUserException(this.error, this.message);

  @override
  String toString() => 'FetchUserException: $message';
}

class TaskApi extends TaskGateway {
  final Client _httpClient;
  TaskApi({required Client httpClient}) : _httpClient = httpClient;

  @override
  Future<List<Task>> getTask() async {
    try {
      final response = await _httpClient.get(
        Uri.parse('https://api.example.com/task'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> taskListJson = jsonDecode(response.body);

        return taskListJson.map((json) {
          final taskData = TaskData.fromJson(json as Map<String, dynamic>);
          return Task(
            id: taskData.id,
            name: taskData.name,
            description: taskData.description,
            status: taskData.status,
          );
        }).toList();
      } else {
        return []; // Devuelve lista vacía en caso de error
      }
    } catch (e) {
      return []; // Devuelve lista vacía si hay un error
    }
  }
}
