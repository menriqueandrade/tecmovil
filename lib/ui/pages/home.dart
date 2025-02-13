import 'package:dcsas/ui/helpers/tasks_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/task/task.dart';
import '../../infraestructure/driven-adapter/api/task/controller/task_controller.dart';
import '../components/add-task.dart';
import '../components/edit-task.dart';

class HomePage extends StatelessWidget {
  final TaskController controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Tareas"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () async {
            controller.fetchTask();
          },
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              final Task task = controller.tasks[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
                child: ListTile(
                  leading: Icon(
                    TaskUtils.getTaskIcon(task.status),
                    color: TaskUtils.getTaskColor(task.status),
                    size: 32,
                  ),
                  title: Text(
                    task.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    task.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blueAccent),
                        onPressed: () {
                          Get.dialog(EditTaskDialog(
                              task: task, controller: controller));
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.redAccent),
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text("Confirmar"),
                              content: const Text("¿Eliminar esta tarea?"),
                              actions: [
                                TextButton(
                                    onPressed: () => Get.back(),
                                    child: const Text("Cancelar")),
                                TextButton(
                                  onPressed: () {
                                    controller.deleteTask(task.id!);
                                    Get.back();
                                  },
                                  child: const Text("Eliminar"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Get.dialog(AddTaskDialog());
        },
      ),
    );
  }
}
