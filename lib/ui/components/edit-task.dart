import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/models/task/task.dart';
import '../../infraestructure/driven-adapter/api/task/controller/task_controller.dart';

class EditTaskDialog extends StatefulWidget {
  final Task task;
  final TaskController controller;

  const EditTaskDialog({Key? key, required this.task, required this.controller})
      : super(key: key);

  @override
  _EditTaskDialogState createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late TextEditingController nameController;
  late TextEditingController descController;
  late String statusValue;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.task.name);
    descController = TextEditingController(text: widget.task.description);
    statusValue = widget.task.status;
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Editar Tarea"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Descripción"),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: statusValue,
              items: ['pending', 'completed', 'in progress', 'paused', 'cancelled']
            .map((status) => DropdownMenuItem(
            value: status,
            child: Text(_getStatusLabel(status)),
          ))
            .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    statusValue = value;
                  });
                }
              },
              decoration: const InputDecoration(labelText: "Estado"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            widget.controller.updateTask(
              widget.task.id,
              Task(
                id: widget.task.id,
                name: nameController.text,
                description: descController.text,
                status: statusValue,
              ),
            );
            Get.back(); // Cerrar modal
          },
          child: const Text("Guardar"),
        ),
      ],
    );
  }
}
String _getStatusLabel(String status) {
  switch (status) {
    case 'pending':
      return 'Pendiente';
    case 'completed':
      return 'Completada';
    case 'in progress':
      return 'En progreso';
    case 'paused':
      return 'Pausada';
    case 'cancelled':
      return 'Cancelada';
    default:
      return 'Desconocido';
  }
}
