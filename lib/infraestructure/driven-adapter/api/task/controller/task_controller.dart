import 'package:get/get.dart';
import 'package:dcsas/domain/models/task/task.dart';

import '../../../../../domain/models/task/gateway/task_gateway.dart';

class TaskController extends GetxController {
  final TaskGateway taskGateway = Get.find<TaskGateway>();

  var tasks = <Task>[].obs; // Lista observable de tareas
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    print('onInit called');
    print(
        '\x1B[31m⚡ Se ejecuto antes de renderizar pàntalla y se ejecuto el onInit TaskController\x1B[0m'); // Rojo
    fetchTask();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    print(
        '\x1B[33m⚡ Se termino de renderizar pàntalla y se ejecuto el OnReady TaskController\x1B[0m'); // Amarillo
  }

  @override
  void onClose() {
    super.onClose();
    print('onClose called');
    print(
        '\x1B[0m⚡ Se termino de renderizar pàntalla y se ejecuto el onClose TaskController\x1B[0m'); // Amarillo
  }

  void fetchTask() async {
    try {
      isLoading.value = true;
      tasks.value = await taskGateway.getTask();
    } catch (e) {
      Get.snackbar("Error", "No se pudo obtener la tarea");
    } finally {
      isLoading.value = false;
    }
  }

  void addTask(Task newTask) {
    tasks.add(newTask);
  }

  void removeTask(String taskId) {
    tasks.removeWhere((task) => task.id == taskId);
  }

  void updateTask(String taskId, Task updatedTask) {
  int index = tasks.indexWhere((task) => task.id == taskId);
  if (index != -1) {
    tasks[index] = updatedTask;
    tasks.refresh(); // Forzar actualización en la UI
  }
}
}
