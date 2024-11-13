import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/model/student_classes/result/result_card.dart';
import 'package:maju_trackmate/screens/student/transcript/roadmap_screen.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/constant_values/srudent_result_card_json.dart';
import 'package:maju_trackmate/widgets/student/student_gpa.dart';

class TranscriptScreen extends StatefulWidget {
  const TranscriptScreen({super.key});

  @override
  State<TranscriptScreen> createState() => _TranscriptScreenState();
}

class _TranscriptScreenState extends State<TranscriptScreen> {
  ResultCardData? resultData;

  @override
  void initState() {
    super.initState();
    // Parse the JSON data on init
    parseStudentData();
  }

  void parseStudentData() {
    // Parsing the StudentDataString into a ResultCardData object
    Map<String, dynamic> jsonData = jsonDecode(StudentDataString);
    setState(() {
      resultData = ResultCardData.fromJson(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Handling null check for parsed data
    if (resultData == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Extracting CGPA from the parsed data
    double? cgpa = resultData?.summary?.cgpa;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // Top Header with GPA Circle
              Container(
                height: mq.height * 0.31,
                width: mq.width,
                decoration: const BoxDecoration(
                  color: Color(0xff0D4065),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),

                    const Text(
                      'Transcript',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // GPA Circle Widget
                    const SizedBox(height: 10),
                    GPACircle(
                      gpa: cgpa ?? 0.0,
                    ),

                    // Display Student Name
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () {
                            Get.to(() => RoadmapScreen(
                                  resultData: resultData,
                                ));
                          },
                          child: const Text(
                            "Road map",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Display Semesters Information
              Expanded(
                child: ListView.builder(
                  itemCount: resultData?.semesters?.length ?? 0,
                  itemBuilder: (context, index) {
                    final semester = resultData!.semesters![index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 16),
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
                          Text(
                            "[${semester.semester} ${semester.year}]",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(height: 10),

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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "COURSE TITLE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "CREDIT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "GRADE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),

                              // Course Rows
                              ...semester.courses!.map((course) {
                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        course.code ?? "",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        course.title ?? "",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        course.creditHours.toString(),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        course.grade ?? "",
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ],
                          ),

                          // GPA Section
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Semester GPA: ${semester.gpa!.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
