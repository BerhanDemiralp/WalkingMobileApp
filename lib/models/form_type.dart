import 'package:flutter/material.dart';

enum FormType {
  RoutineCheck,
  Vaccination,
  Surgery,
  Emergency,
}

// Helper extension for FormType
extension FormTypeExtension on FormType {
  String get displayTitle {
    switch (this) {
      case FormType.RoutineCheck:
        return 'Routine Check';
      case FormType.Vaccination:
        return 'Vaccination';
      case FormType.Surgery:
        return 'Surgery';
      case FormType.Emergency:
        return 'Emergency';
    }
  }

  IconData get icon {
    switch (this) {
      case FormType.RoutineCheck:
        return Icons.check_circle_outline;
      case FormType.Vaccination:
        return Icons.colorize; // Represents a syringe
      case FormType.Surgery:
        return Icons.local_hospital;
      case FormType.Emergency:
        return Icons.warning_amber_rounded;
    }
  }
}
