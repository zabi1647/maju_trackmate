import 'package:flutter/material.dart';
import 'package:maju_trackmate/model/faculty/faculty_time_table_data.dart';

class FacultyClassTimingWidget extends StatelessWidget {
  final Timetable item;
  final bool isLast;

  const FacultyClassTimingWidget(
      {super.key, required this.item, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time Column

          // Vertical Line and Dot
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: !isLast
                        ? Colors.blue.withOpacity(0.5)
                        : Colors.transparent,
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Subject Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.startTime} - ${item.endTime}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${item.courseName} (${item.room})',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
