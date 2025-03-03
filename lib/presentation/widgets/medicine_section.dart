import 'package:flutter/material.dart';

class MedicineSection extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> medicines;

  const MedicineSection({super.key, required this.title, required this.medicines});

  Widget _buildMedicineItem(Map<String, dynamic> medicine) {
    IconData statusIcon;
    Color statusColor;

    switch (medicine['status']) {
      case 'taken':
        statusIcon = Icons.notifications_active;
        statusColor = Colors.green;
        break;
      case 'missed':
        statusIcon = Icons.notifications_off;
        statusColor = Colors.red;
        break;
      case 'snoozed':
        statusIcon = Icons.notifications_paused;
        statusColor = Colors.orange;
        break;
      default:
        statusIcon = Icons.notifications;
        statusColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: medicine['color'], borderRadius: BorderRadius.circular(8)),
            child: const Center(child: Icon(Icons.medication, color: Colors.white)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(medicine['name'], style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(height: 4),
                Text('${medicine['instruction']} · ${medicine['day']}', style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              ],
            ),
          ),
          Icon(statusIcon, color: statusColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      ...medicines.map((medicine) => _buildMedicineItem(medicine)),
    ]);
  }
}
