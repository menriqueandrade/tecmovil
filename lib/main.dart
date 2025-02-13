import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'domain/models/task/gateway/task_gateway.dart';
import 'infraestructure/driven-adapter/api/task/controller/task_controller.dart';
import 'infraestructure/driven-adapter/api/task/task-api.dart';


void main() {
  Get.put<TaskGateway>(TaskApi());
  Get.put(TaskController());
  runApp(const MyApp());
}

