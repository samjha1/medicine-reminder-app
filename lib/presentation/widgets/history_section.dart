import 'package:flutter/material.dart';
import 'package:sam/presentation/widgets/dayitems.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> days = [
      {'day': 'SUN', 'date': '1'},
      {'day': 'MON', 'date': '2'},
      {'day': 'TUE', 'date': '3'},
      {'day': 'WED', 'date': '4'},
      {'day': 'THU', 'date': '5'},
      {'day': 'FRI', 'date': '6'},
      {'day': 'SAT', 'date': '7'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Check History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[600]),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: days
              .map((day) => DayItem(
                    day: day['day']!,
                    date: day['date']!,
                    isSelected: day['day'] == 'SUN',
                  ))
              .toList(),
        ),
      ],
    );
  }
}
