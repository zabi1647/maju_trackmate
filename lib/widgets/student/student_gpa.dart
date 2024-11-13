import 'package:flutter/material.dart';

class GPACircle extends StatelessWidget {
  final double gpa; // Current GPA
  final double maxGpa; // Max GPA (e.g., 4.0)

  const GPACircle({super.key, required this.gpa, this.maxGpa = 4.0});

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage of the GPA for the progress indicator
    double gpaPercentage = gpa / maxGpa;

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 5), // Outer white border
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circular progress indicator filling the entire container
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: gpaPercentage,
              strokeWidth: 8,
              color: Colors.blue, // Color of the progress indicator
              backgroundColor:
                  Colors.white.withOpacity(0.2), // Progress background color
            ),
          ),
          // Display GPA in the center
          Text(
            '${gpa.toStringAsFixed(2)}/$maxGpa',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
