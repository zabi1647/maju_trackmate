import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/faculty/add_attendace.dart';
import 'package:maju_trackmate/apis/faculty/get_number_of_students_in_class.dart';
import 'package:maju_trackmate/apis/faculty/get_faculty_time_table_data.dart';
import 'package:maju_trackmate/model/faculty/number_of_students_in_class.dart';
import 'package:maju_trackmate/model/faculty/faculty_time_table_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AttendancePageScreen extends StatefulWidget {
  const AttendancePageScreen({super.key});

  @override
  State<AttendancePageScreen> createState() => _AttendancePageScreenState();
}

class _AttendancePageScreenState extends State<AttendancePageScreen> {
  bool dayAndTime = false;
  bool courseAndSection = false;
  NumberOfStudentsInClass? studentData;

  List<Timetable>? timetableData;
  Timetable? selectedDayAndTime;
  Timetable? selectedCourse;
  List<String> presentStudents = []; // IDs of present students
  List<String> absentStudents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: studentData == null
          ? const Center(
              child: Text(''),
            )
          : SizedBox(
              height: mq.height * 0.05,
              width: mq.width * 0.3,
              child: ElevatedButton(
                onPressed: () async {
                  print('Present Students: $presentStudents');
                  print('Absent Students: $absentStudents');

                  if (presentStudents.isNotEmpty) {
                    // Add logic to send this data to the backend or API
                    bool value = await AddStudentAttendanceApi().addAttendence(
                        selectedCourse!.lectureId.toString(), presentStudents);
                    if (value) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                  "Attendance Added",
                                  style: TextStyle(
                                    color: Color(0xff0D4065),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: SizedBox(
                                  width: mq.width * 0.2,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        presentStudents.clear();
                                        absentStudents.clear();
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const WidgetStatePropertyAll(
                                            Color(0xff0D4065),
                                          ),
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          )),
                                      child: const Text(
                                        "Ok",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ));
                    }
                  } else {
                    MyDialogs.error(
                        msg: "Please mark attendance for at least one student");
                  }
                  // Add logic to send this data to the backend or API
                },
                style: ButtonStyle(
                  backgroundColor:
                      const WidgetStatePropertyAll(Color(0xff0D4065)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Header Section
                Container(
                  height: mq.height * 0.2,
                  width: mq.width,
                  decoration: const BoxDecoration(
                    color: Color(0xff0D4065),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: getLogoutButton(),
                      ),
                      Image.asset(
                        'assets/png/icons/student/attendance.png',
                        height: mq.height * 0.07,
                      ),
                      const Text(
                        'Attendance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: mq.height * 0.02),

                // Future Builder for Timetable Data
                FutureBuilder(
                  future: GetFaclutyTimeTableData().fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error in loading data: ${snapshot.error}"),
                      );
                    } else {
                      timetableData = snapshot.data!.timetable;
                      return Column(
                        children: [
                          // Day & Time Button
                          SizedBox(
                            width: mq.width * 0.9,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  dayAndTime = !dayAndTime;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0D4065),
                              ),
                              child: const Text(
                                'Day & Time',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          if (dayAndTime)
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(),
                              width: mq.width * 0.9,
                              child: Column(
                                children: [
                                  Container(
                                    height: mq.height * 0.05,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: Colors.black),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Day",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                            Text(
                                              "Time",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: timetableData!.length,
                                      itemBuilder: (context, index) {
                                        final data = timetableData![index];
                                        return ListTile(
                                          title: Text("${data.day}"),
                                          trailing: Text(
                                              "${data.startTime} - ${data.endTime}"),
                                          onTap: () {
                                            setState(() {
                                              selectedDayAndTime = data;
                                              dayAndTime = false;
                                              courseAndSection = true;
                                            });
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(height: mq.height * 0.02),

                          // Course with Section Button
                          SizedBox(
                            width: mq.width * 0.9,
                            child: ElevatedButton(
                              onPressed: selectedDayAndTime == null
                                  ? null
                                  : () {
                                      setState(() {
                                        courseAndSection = !courseAndSection;
                                      });
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0D4065),
                              ),
                              child: const Text(
                                'Course with Section',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          if (courseAndSection && selectedDayAndTime != null)
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: mq.width * 0.9,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: timetableData!.length,
                                itemBuilder: (context, index) {
                                  final data = timetableData![index];
                                  if (data.day != selectedDayAndTime!.day ||
                                      data.startTime !=
                                          selectedDayAndTime!.startTime) {
                                    return Container();
                                  }
                                  return ListTile(
                                    title: Text("${data.courseName})"),
                                    onTap: () {
                                      setState(() {
                                        selectedCourse = data;
                                        courseAndSection = false;
                                      });
                                      fetchStudentData(data.lectureId!);
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      );
                    }
                  },
                ),
                // make table of attendance here
                SizedBox(height: mq.height * 0.02),
                studentData == null
                    ? const Center(
                        child: Text(''),
                      )
                    : SizedBox(
                        width: mq.width * 0.9,
                        height: mq.height * 0.6,
                        child: Column(
                          children: [
                            // Table Header
                            Table(
                              border: TableBorder.all(color: Colors.black),
                              columnWidths: const {
                                0: FractionColumnWidth(0.1), // Serial Number
                                1: FractionColumnWidth(
                                    0.5), // Student Name and Username
                                2: FractionColumnWidth(0.2), // Present Button
                                3: FractionColumnWidth(0.2), // Absent Button
                              },
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                TableRow(
                                  decoration: const BoxDecoration(
                                    color: Color(0xff0D4065),
                                  ),
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'S.No',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Name and Id',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Present',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Absent',
                                        style: TextStyle(color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // Table Body
                            Expanded(
                              child: SingleChildScrollView(
                                child: Table(
                                  border: TableBorder.all(color: Colors.black),
                                  columnWidths: const {
                                    0: FractionColumnWidth(0.1),
                                    1: FractionColumnWidth(0.5),
                                    2: FractionColumnWidth(0.2),
                                    3: FractionColumnWidth(0.2),
                                  },
                                  children: List.generate(
                                      studentData!.students!.length, (index) {
                                    final student =
                                        studentData!.students![index];
                                    return TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${index + 1}',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${student.studentName} (${student.studentUsername})',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.circle,
                                            color: presentStudents.contains(
                                                    student.studentUsername!)
                                                ? Colors.green
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              toggleAttendance(
                                                  student.studentUsername!,
                                                  isPresent: true);
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.circle,
                                            color: absentStudents.contains(
                                                    student.studentUsername!)
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              toggleAttendance(
                                                  student.studentUsername!,
                                                  isPresent: false);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  }),
                                ),
                              ),
                            ),

                            // Submit Button
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleAttendance(String studentId, {required bool isPresent}) {
    if (isPresent) {
      // Add to present list if not already present and remove from absent list
      if (!presentStudents.contains(studentId)) {
        presentStudents.add(studentId);
      }
      absentStudents.remove(studentId);
    } else {
      // Add to absent list if not already present and remove from present list
      if (!absentStudents.contains(studentId)) {
        absentStudents.add(studentId);
      }
      presentStudents.remove(studentId);
    }
  }

  Future<void> fetchStudentData(int lectureId) async {
    studentData =
        await GetNumberOfStudentsInClassData().fetchData(lectureId.toString());
    setState(() {});
  }
}
