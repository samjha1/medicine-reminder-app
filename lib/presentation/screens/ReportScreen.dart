import 'package:flutter/material.dart';
import '../widgets/report_item.dart';
import '../widgets/dashboard_section.dart';
import '../widgets/history_section.dart';
import '../widgets/medicine_section.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const ReportItem(),
        const SizedBox(height: 20),
        const DashboardSection(),
        const SizedBox(height: 20),
        const HistorySection(),
        const SizedBox(height: 20),
        MedicineSection(
          title: 'Morning 08:00 am',
          medicines: [
            {
              'name': 'Calpol 500mg Tablet',
              'instruction': 'Before Breakfast',
              'day': 'Day 01',
              'color': Colors.purple.shade100,
              'status': 'taken',
            },
            {
              'name': 'Calpol 500mg Tablet',
              'instruction': 'Before Breakfast',
              'day': 'Day 27',
              'color': Colors.pink.shade100,
              'status': 'missed',
            },
          ],
        ),
        const SizedBox(height: 20),
        MedicineSection(
          title: 'Afternoon 02:00 pm',
          medicines: [
            {
              'name': 'Calpol 500mg Tablet',
              'instruction': 'After Food',
              'day': 'Day 01',
              'color': Colors.purple.shade100,
              'status': 'snoozed',
            },
          ],
        ),
      ],
    );
  }
}
