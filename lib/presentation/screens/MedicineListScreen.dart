import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sam/data/datasources/data.dart';
import 'package:sam/data/models/modelapp.dart';

class MedicineListScreen extends StatefulWidget {
  const MedicineListScreen({Key? key}) : super(key: key);

  @override
  State<MedicineListScreen> createState() => _MedicineListScreenState();
}

class _MedicineListScreenState extends State<MedicineListScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDateSelector(),
        _buildEmptyState(),
        Expanded(
          child: ListView(
            children: [
              _buildTimeSection(
                  'Morning 08:00 am',
                  MedicineData()
                      .medicines
                      .where((m) => m.time == '08:00 am')
                      .toList()),
              _buildTimeSection(
                  'Afternoon 02:00 pm',
                  MedicineData()
                      .medicines
                      .where((m) => m.time == '02:00 pm')
                      .toList()),
              _buildTimeSection(
                  'Night 09:00 pm',
                  MedicineData()
                      .medicines
                      .where((m) => m.time == '09:00 pm')
                      .toList()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Thr', style: TextStyle(color: Colors.grey[600])),
          Text('Fri', style: TextStyle(color: Colors.grey[600])),
          const Icon(Icons.arrow_left, color: Colors.blue),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Saturday, Sep 3',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Icon(Icons.arrow_right, color: Colors.blue),
          Text('Sun', style: TextStyle(color: Colors.grey[600])),
          Text('Mon', style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    if (MedicineData.isNotEmpty) return const SizedBox();

    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CustomPaint(
                  size: const Size(100, 100),
                  painter: BoxPainter(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Nothing Is Here, Add a Medicine',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSection(String title, List<Medicine> medicines) {
    if (medicines.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...medicines.map((medicine) => _buildMedicineCard(medicine)),
      ],
    );
  }

  Widget _buildMedicineCard(Medicine medicine) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: medicine.color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: _getMedicineIcon(medicine.type),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicine.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${medicine.instruction} · ${medicine.dayCount}',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _getStatusIcon(medicine.status),
          ],
        ),
      ),
    );
  }

  Widget _getMedicineIcon(MedicineType type) {
    switch (type) {
      case MedicineType.tablet:
        return const Icon(Icons.circle, color: Colors.white);
      case MedicineType.capsule:
        return Transform.rotate(
          angle: 1.5,
          child: const Icon(Icons.airport_shuttle, color: Colors.white),
        );
      case MedicineType.cream:
        return const Icon(Icons.ac_unit, color: Colors.white);
      case MedicineType.liquid:
        return const Icon(Icons.opacity, color: Colors.white);
      default:
        return const Icon(Icons.medication, color: Colors.white);
    }
  }

  Widget _getStatusIcon(Status status) {
    switch (status) {
      case Status.taken:
        return Icon(
          Icons.notifications_active,
          color: Colors.green[400],
        );
      case Status.missed:
        return Icon(
          Icons.notifications_off,
          color: Colors.red[400],
        );
      case Status.snoozed:
        return Icon(
          Icons.notifications_paused,
          color: Colors.orange[400],
        );
      case Status.left:
        return Icon(
          Icons.notifications,
          color: Colors.grey[400],
        );
      default:
        return Icon(
          Icons.notifications,
          color: Colors.grey[400],
        );
    }
  }
}

class BoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromLTWH(
      size.width * 0.2,
      size.height * 0.3,
      size.width * 0.6,
      size.height * 0.6,
    );

    final path = Path()
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.top)
      ..lineTo(rect.right, rect.top)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.left, rect.bottom);

    canvas.drawPath(path, paint);

    final lidPath = Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(size.width * 0.3, size.height * 0.1)
      ..lineTo(size.width * 0.7, size.height * 0.1)
      ..lineTo(rect.right, rect.top);

    canvas.drawPath(lidPath, paint);

    final rightLine = Path()
      ..moveTo(rect.right, rect.top)
      ..lineTo(size.width * 0.7, size.height * 0.1);

    canvas.drawPath(rightLine, paint);

    final squiggle1 = Path()
      ..moveTo(size.width * 0.3, size.height * 0.1)
      ..quadraticBezierTo(
        size.width * 0.2,
        size.height * 0.05,
        size.width * 0.1,
        size.height * 0.15,
      );

    canvas.drawPath(squiggle1, paint);

    final squiggle2 = Path()
      ..moveTo(size.width * 0.7, size.height * 0.1)
      ..quadraticBezierTo(
        size.width * 0.8,
        size.height * 0.05,
        size.width * 0.9,
        size.height * 0.15,
      );

    canvas.drawPath(squiggle2, paint);

    final diamondPath = Path()
      ..moveTo(size.width * 0.3, rect.top + (rect.height * 0.3))
      ..lineTo(size.width * 0.5, rect.top + (rect.height * 0.5))
      ..lineTo(size.width * 0.7, rect.top + (rect.height * 0.3))
      ..lineTo(size.width * 0.5, rect.top + (rect.height * 0.1))
      ..close();

    final diamondPaint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.fill;

    canvas.drawPath(diamondPath, diamondPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
