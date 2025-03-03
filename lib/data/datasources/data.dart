import 'package:flutter/material.dart';
import 'package:sam/data/models/modelapp.dart';

class MedicineData {
  static final MedicineData _instance = MedicineData._internal();

  MedicineData._internal();

  factory MedicineData() {
    return _instance;
  }

  final List<Medicine> medicines = [
    Medicine(
      name: 'Calpol 500mg Tablet',
      dosage: '500mg',
      instruction: 'Before Breakfast',
      dayCount: 'Day 01',
      color: Colors.pink.shade100,
      type: MedicineType.tablet,
      time: '08:00 am',
      status: Status.taken,
    ),
    Medicine(
      name: 'Calpol 500mg Tablet',
      dosage: '500mg',
      instruction: 'Before Breakfast',
      dayCount: 'Day 27',
      color: Colors.blue.shade100,
      type: MedicineType.capsule,
      time: '08:00 am',
      status: Status.missed,
    ),
    Medicine(
      name: 'Calpol 500mg Tablet',
      dosage: '500mg',
      instruction: 'After Food',
      dayCount: 'Day 01',
      color: Colors.purple.shade100,
      type: MedicineType.tablet,
      time: '02:00 pm',
      status: Status.snoozed,
    ),
    Medicine(
      name: 'Calpol 500mg Tablet',
      dosage: '500mg',
      instruction: 'Before Sleep',
      dayCount: 'Day 03',
      color: Colors.red.shade100,
      type: MedicineType.tablet,
      time: '09:00 pm',
      status: Status.left,
    ),
  ];

  static bool get isNotEmpty => _instance.medicines.isNotEmpty;
}
