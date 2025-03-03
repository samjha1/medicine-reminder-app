import 'package:flutter/material.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({super.key});

  Widget _buildReportItem(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildReportItem('5', 'Total', Colors.blue),
          _buildReportItem('3', 'Taken', Colors.blue),
          _buildReportItem('1', 'Missed', Colors.blue),
          _buildReportItem('1', 'Snoozed', Colors.blue),
        ],
      ),
    );
  }
}
