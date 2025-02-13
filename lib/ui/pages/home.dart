import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/task/task.dart';
import '../../infraestructure/driven-adapter/api/task/controller/task_controller.dart';

class HomePage extends StatelessWidget {
  final TaskController controller = Get.find<TaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mis Tareas",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: controller.tasks.length, // Solo una tarea por ahora
          itemBuilder: (context, index) {
            final Task task = controller.tasks[index];

            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 5,
              child: ListTile(
                leading: Icon(
                  task.status == 'completed'
                      ? Icons.check_circle
                      : Icons.pending,
                  color:
                      task.status == 'completed' ? Colors.green : Colors.orange,
                  size: 32,
                ),
                title: Text(task.name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
                subtitle: Text(task.description,
                    maxLines: 2, overflow: TextOverflow.ellipsis),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blueAccent),
                  onPressed: () {
                    Get.snackbar("Editar", "Funcionalidad en desarrollo");
                  },
                ),
                onTap: () {
                  Get.snackbar("Detalles",
                      "Tarea: ${task.name}\nEstado: ${task.status}");
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Get.snackbar("Nueva Tarea", "Funcionalidad en desarrollo");
        },
      ),
    );
  }
}
