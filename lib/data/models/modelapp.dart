import 'dart:ui';

class Medicine {
  final String name;
  final String dosage;
  final String instruction;
  final String dayCount;
  final Color color;
  final MedicineType type;
  final String time;
  final Status status;

  Medicine({
    required this.name,
    required this.dosage,
    required this.instruction,
    required this.dayCount,
    required this.color,
    required this.type,
    required this.time,
    required this.status,
  });
}

enum MedicineType { tablet, capsule, cream, liquid }
enum Status { taken, missed, snoozed, left }