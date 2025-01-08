import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maju_trackmate/model/student_classes/couses/currenlty_enrolled_course.dart';
import 'package:maju_trackmate/model/student_classes/result/result_card.dart';
import 'package:maju_trackmate/utils/constant_values/currently_enrolled_courses.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/bar_chart.dart';

class RoadmapScreen extends StatefulWidget {
  final ResultCardData? resultData;
  const RoadmapScreen({super.key, this.resultData});

  @override
  State<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  CurrentlyEnRolledCourses? currentcourses;

  @override
  void initState() {
    super.initState();
    // Parse the JSON data on init
    parseStudentData();
  }

  void parseStudentData() {
    // Parsing the StudentDataString into a ResultCardData object
    Map<String, dynamic> jsonData = jsonDecode(currentlyEnrolledCoursesString);
    setState(() {
      currentcourses = CurrentlyEnRolledCourses.fromJson(jsonData);
    });
  }
  // Function to filter courses with grade "D" or lower

  List<Map<String, dynamic>> getLowGradeCourses() {
    List<Map<String, dynamic>> lowGradeCourses = [];
    if (widget.resultData?.semesters != null) {
      for (var semester in widget.resultData!.semesters!) {
        for (var course in semester.courses ?? []) {
          // Check if the grade is "D" or below
          if (course.grade != null &&
              (course.grade == "D" ||
                  course.grade == "F" ||
                  course.grade == "E")) {
            lowGradeCourses.add({
              'courseTitle': course.title,
              'grade': course.grade,
            });
          }
        }
      }
    }
    return lowGradeCourses;
  }

  @override
  Widget build(BuildContext context) {
    final lowGradeCourses = getLowGradeCourses();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0D4065),
        foregroundColor: Colors.white,
        title: const Text(
          "Roadmap",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Top Container with Bar Chart
                Container(
                  height: mq.height * 0.23,
                  width: mq.width,
                  decoration: const BoxDecoration(
                    color: Color(0xff0D4065),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      // Bar Chart
                      Row(
                        children: [
                          SizedBox(
                            width: mq.width * 0.02,
                          ),
                          const Text(
                            "GPA",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: mq.height * 0.15,
                            width: mq.width * 0.7,
                            child: const BarChartStyle(),
                          ),
                        ],
                      ),
                      Text(
                        "CGPA: ${widget.resultData?.summary?.cgpa ?? 0.0}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                // Container to display courses with Grade D or lower
                Container(
                  height: mq.height * 0.25,
                  width: mq.width * 0.9,
                  child: Column(
                    children: [
                      // Top Container
                      Container(
                        height: mq.height * 0.05,
                        width: mq.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Color(0xff0D4065),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Need to improve Grades in",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      // Lower Container with Border Overlap
                      Container(
                        height: mq.height * 0.19,
                        width: mq.width * 0.9,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left:
                                BorderSide(color: Color(0xff0D4065), width: 2),
                            right:
                                BorderSide(color: Color(0xff0D4065), width: 2),
                            bottom:
                                BorderSide(color: Color(0xff0D4065), width: 2),
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: lowGradeCourses.isEmpty
                            ? const Center(
                                child: Text(
                                  "No courses with low grades found",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.all(8.0),
                                itemCount: lowGradeCourses.length,
                                itemBuilder: (context, index) {
                                  final course = lowGradeCourses[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '. ${course['courseTitle']}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color(0xff0D4065)),
                                        ),
                                        Text(
                                          course['grade'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color(0xff0D4065)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                    height: mq.height * 0.52,
                    width: mq.width * 0.9,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Semester Heading

                        // Table Headers
                        Table(
                          // border: TableBorder.all(color: Colors.grey),
                          columnWidths: const {
                            0: FractionColumnWidth(0.21),
                            1: FractionColumnWidth(0.39),
                            2: FractionColumnWidth(0.2),
                            3: FractionColumnWidth(0.2),
                          },
                          children: [
                            const TableRow(
                              decoration:
                                  BoxDecoration(color: Color(0xFFEFEFEF)),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "COURSE ID",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "COURSE TITLE",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "COURSE TYPE",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "PRE-REC",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),

                            // Course Rows
                            ...currentcourses!.courses!.map((course) {
                              return TableRow(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      course.courseId ?? "",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      course.courseTitle ?? "",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      course.courseType!,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      course.preRequisites ?? "",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ],
                        ),

                        // GPA Section
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
