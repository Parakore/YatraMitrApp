import 'package:flutter/material.dart';

enum GrievanceStatus { pending, inProgress, resolved }

class Grievance {
  final String id;
  final String category;
  final String description;
  final DateTime timestamp;
  final GrievanceStatus status;
  final String? location;

  Grievance({
    required this.id,
    required this.category,
    required this.description,
    required this.timestamp,
    this.status = GrievanceStatus.pending,
    this.location,
  });
}

class GrievanceCategory {
  final String name;
  final IconData icon;
  final Color color;

  GrievanceCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}
