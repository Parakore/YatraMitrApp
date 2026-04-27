import 'package:flutter/material.dart';

/// Status of the grievance in the system
enum GrievanceStatus { 
  pending,      // Step 1: Submitted
  allocating,   // Step 2: AI Dept Allocation
  inProgress,   // Step 3: SLA Timer Started
  actionTaken,  // Step 4: Work in progress
  resolved      // Step 5: Resolution + Feedback
}

/// Model representing a pilgrim's grievance
@immutable
class Grievance {
  final String id;
  final String category;
  final String description;
  final DateTime timestamp;
  final GrievanceStatus status;
  final String? location;
  final String? department;
  final String? sla; // e.g., "6 hrs remaining"
  final String? geoTag; // e.g., "Rambara (8.5 km)"
  final String? photoUrl;

  const Grievance({
    required this.id,
    required this.category,
    required this.description,
    required this.timestamp,
    this.status = GrievanceStatus.pending,
    this.location,
    this.department,
    this.sla,
    this.geoTag,
    this.photoUrl,
  });

  Grievance copyWith({
    String? id,
    String? category,
    String? description,
    DateTime? timestamp,
    GrievanceStatus? status,
    String? location,
    String? department,
    String? sla,
    String? geoTag,
    String? photoUrl,
  }) {
    return Grievance(
      id: id ?? this.id,
      category: category ?? this.category,
      description: description ?? this.description,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      location: location ?? this.location,
      department: department ?? this.department,
      sla: sla ?? this.sla,
      geoTag: geoTag ?? this.geoTag,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}

/// Category metadata for grievance selection
class GrievanceCategory {
  final String name;
  final IconData icon;
  final Color color;

  const GrievanceCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}
