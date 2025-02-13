import 'package:flutter/material.dart';

class TaskUtils {
  static IconData getTaskIcon(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Icons.check_circle; // ✅ Completado
      case 'in progress':
        return Icons.play_arrow; // ▶️ En progreso
      case 'paused':
        return Icons.pause_circle; // ⏸ Pausado
      case 'cancelled':
        return Icons.cancel; // ❌ Cancelado
      case 'pending':
        return Icons.pending; // ⏳ Pendiente
      default:
        return Icons.help_outline; // ❓ Estado desconocido
    }
  }

  static Color getTaskColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'in progress':
        return Colors.blue;
      case 'paused':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      case 'pending':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}
