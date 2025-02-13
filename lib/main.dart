import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'domain/models/task/gateway/task_gateway.dart';
import 'infraestructure/driven-adapter/api/task/controller/task_controller.dart';
import 'infraestructure/driven-adapter/api/task/task_fake.dart';

void main() {
  Get.put<TaskGateway>(TaskFake());
  Get.put(TaskController());
  runApp(const MyApp());
}

