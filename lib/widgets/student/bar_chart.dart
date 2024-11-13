import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:maju_trackmate/model/student_classes/result/result_card.dart';
import 'package:maju_trackmate/utils/constant_values/srudent_result_card_json.dart';

// Define your AppColors based on your requirement
class AppColors {
  static const Color contentColorBlue = Colors.blue;
  static const Color contentColorCyan = Colors.cyan;
}

class BarChartStyle extends StatelessWidget {
  const BarChartStyle();

  @override
  Widget build(BuildContext context) {
    final List<BarChartGroupData> barGroups = getBarGroups();
    return Stack(
      children: [
        BarChart(
          BarChartData(
            barTouchData: barTouchData,
            titlesData: titlesData(),
            borderData: borderData,
            barGroups: barGroups,
            gridData: const FlGridData(show: false),
            alignment: BarChartAlignment.spaceAround,
            maxY: 4.0,
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: barGroups.map((group) {
                    final rod = group.barRods[0];
                    return Container(
                      width: 16,
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        rod.toY.toStringAsFixed(2),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  // Define the barTouchData with tooltip
  List<BarChartGroupData> getBarGroups() {
    final resultData = ResultCardData.fromJson(jsonDecode(StudentDataString));

    // Prepare bar chart groups based on semesters
    return resultData.semesters?.asMap().entries.map((entry) {
          final index = entry.key;
          final semester = entry.value;

          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: semester.gpa ?? 0,
                width: 30,
                gradient: _barsGradient,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
            showingTooltipIndicators: [0],
          );
        }).toList() ??
        [];
  }

// Define the barTouchData with tooltip
  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          // tooltipBgColor: Colors.transparent, // Remove background color
          tooltipPadding: EdgeInsets.zero, // Remove padding
          tooltipMargin: 0, // Remove margin
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            // Extract the semester name and year from the JSON data
            final resultData =
                ResultCardData.fromJson(jsonDecode(StudentDataString));
            final semesterName =
                resultData.semesters?[groupIndex].semester ?? '';
            final year = resultData.semesters?[groupIndex].year ?? '';

            // Format semester as "FA22"
            final semesterShort = semesterName.isNotEmpty && year.isNotEmpty
                ? '${semesterName.substring(0, 2)}${year.substring(2)}'
                : semesterName;

            // Return plain text without any fill or background
            return BarTooltipItem(
              semesterShort,
              const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );
  // Define the titlesData
  FlTitlesData titlesData() => const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  // Define the borderData
  FlBorderData get borderData => FlBorderData(show: false);

  // Extracting bar groups from the JSON data

  // Define the bars gradient
  LinearGradient get _barsGradient => const LinearGradient(
        colors: [Color(0xff041826), Color(0xff041826)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );
}
