
import 'package:dcsas/domain/models/task/gateway/task_gateway.dart';
import 'package:dcsas/domain/models/task/task.dart';
import 'package:dio/dio.dart';

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
  final Dio dio = Dio(BaseOptions(
    baseUrl: "https://api-eventu-app.vercel.app",
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
  ));

  @override
  Future<List<Task>> getTask() async {
    try {
      final response = await dio.get('/get-tasks');
      return (response.data as List)
          .map((json) => Task(
                id: json['id'],
                name: json['name'],
                description: json['description'],
                status: json['status'],
              ))
          .toList();
    } on DioException catch (e) {
      throw FetchUserException(_mapDioError(e), "Error al obtener tareas");
    }
  }

  @override
  Future<Task> addTask(Task task) async {
    try {
      final response = await dio.post('/add-task', data: {
        "name": task.name,
        "description": task.description,
        "status": task.status,
      });

      return Task(
        id: response.data['id'],
        name: response.data['name'],
        description: response.data['description'],
        status: response.data['status'],
      );
    } on DioException catch (e) {
      throw FetchUserException(_mapDioError(e), "Error al agregar tarea");
    }
  }

  @override
  Future<void> updateTask(String id, Task task) async {
    try {
      await dio.put('/update-task/$id', data: {
        "name": task.name,
        "description": task.description,
        "status": task.status,
      });
    } on DioException catch (e) {
      throw FetchUserException(_mapDioError(e), "Error al actualizar tarea");
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await dio.delete('/delete-task/$id');
    } on DioException catch (e) {
      throw FetchUserException(_mapDioError(e), "Error al eliminar tarea");
    }
  }

  FetchUserError _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return FetchUserError.serverError;

      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 404) {
          return FetchUserError.notFound;
        }
        return FetchUserError.serverError;

      default:
        return FetchUserError.unknown;
    }
  }
}
