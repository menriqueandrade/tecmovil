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
    
}
  @override
  Future<void> onReady() async {
    super.onReady();
    print(
        '\x1B[33m⚡ Se termino de renderizar pàntalla y se ejecuto el OnReady TaskController\x1B[0m'); // Amarillo
        fetchTask();
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

  Future<void> addTask(Task task) async {
    await taskGateway.addTask(task);
    fetchTask();
  }

  Future<void> updateTask(String id, Task task) async {
    await taskGateway.updateTask(id, task);
    fetchTask();
  }

  Future<void> deleteTask(String id) async {
    await taskGateway.deleteTask(id);
    fetchTask();
  }
}
