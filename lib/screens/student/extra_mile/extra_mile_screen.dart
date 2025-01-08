import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/student/get_extra_classes_data.dart';
import 'package:maju_trackmate/apis/student/get_extra_curricular_data.dart';
import 'package:maju_trackmate/model/student_classes/extra_mile/extra_classes_Data.dart';
import 'package:maju_trackmate/screens/student/extra_mile/activity_details.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/classes_timing_widget.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class ExtraMileScreen extends StatefulWidget {
  const ExtraMileScreen({super.key});

  @override
  State<ExtraMileScreen> createState() => _ExtraMileScreenState();
}

class _ExtraMileScreenState extends State<ExtraMileScreen> {
  // Booleans to manage visibility of containers
  bool showExtraCurricular = false;
  bool showExtraClassNotification = false;
  final List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  // Track the selected day
  String _selectedDay = 'Mon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: getLogoutButton(),
                        ),
                        Image.asset(
                          'assets/png/icons/student/extra_mile_image.png',
                          height: mq.height * 0.07,
                        ),
                        const Text(
                          'Extra Mile',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: mq.height * 0.02),

                // Section Title
                const Text(
                  "Extra Step",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff0D4065),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Color(0xff0D4065),
                    thickness: 2,
                  ),
                ),
                SizedBox(height: mq.height * 0.02),

                // Extra Curricular Activities Button
                SizedBox(
                  width: mq.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showExtraCurricular = !showExtraCurricular;
                        if (showExtraCurricular) {
                          showExtraClassNotification =
                              false; // hide other section
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0D4065),
                    ),
                    child: const Text(
                      'Extra Curricular Activities',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Extra Curricular Activities Container
                if (showExtraCurricular)
                  Container(
                      width: mq.width * 0.9,
                      height: mq.height * 0.3,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        // color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        // border: Border.all(color: Colors.blue),
                      ),
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
                              child: Text(
                                "Activities",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ),
                          ),
                          Container(
                            height: mq.height * 0.24,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: FutureBuilder(
                                future: GetExtraCurricularData().fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                      child: Text("error"),
                                    );
                                  } else {
                                    if (snapshot.data?.extracurricularactivities
                                            ?.isEmpty ??
                                        snapshot.data
                                                ?.extracurricularactivities ==
                                            null) {
                                      return const Center(
                                        child: Text("No activities found"),
                                      );
                                    } else {
                                      return ListView.builder(
                                          itemCount: snapshot
                                                  .data
                                                  ?.extracurricularactivities
                                                  ?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                top: 20,
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  Get.to(() => ActivityDetails(
                                                        activity: snapshot.data!
                                                                .extracurricularactivities![
                                                            index],
                                                      ));
                                                },
                                                child: Text(
                                                    "${snapshot.data?.extracurricularactivities?[index].title} "),
                                              ),
                                            );
                                          });
                                    }
                                  }
                                }),
                          )
                        ],
                      )),

                SizedBox(height: mq.height * 0.02),

                // Extra Class Notification Button
                SizedBox(
                  width: mq.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showExtraClassNotification =
                            !showExtraClassNotification;
                        if (showExtraClassNotification) {
                          showExtraCurricular = false; // hide other section
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0D4065),
                    ),
                    child: const Text(
                      'Extra Class Notification',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Extra Class Notification Container
                if (showExtraClassNotification)
                  Container(
                    height: mq.height * 0.34,
                    width: mq.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff0D4065),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            children: [
                              Text(
                                "Extra Classes",
                                style: TextStyle(
                                    color: Color(0xff0D4065),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              ImageIcon(
                                AssetImage(
                                    "assets/png/icons/student/calender_icon.png"),
                                size: 50,
                                color: Color(0xff0D4065),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mq.height * 0.003,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: weekdays
                                .map((day) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedDay = day;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: _selectedDay == day
                                              ? Colors.blue
                                              : Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          day,
                                          style: TextStyle(
                                            color: _selectedDay == day
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: _selectedDay == day
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                        FutureBuilder<MakeUpClassesData>(
                          future: GetExtraClassData().fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text("Error fetching data"),
                              );
                            } else if (!snapshot.hasData ||
                                snapshot.data!.makeupLectures == null) {
                              return const Center(
                                child: Text(
                                  'No schedule available',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            } else {
                              final MakeUpClassesData timeTableData =
                                  snapshot.data!;
                              // Filter the timetable based on the selected day
                              final List<MakeupLectures> filteredTimetable =
                                  timeTableData.makeupLectures!
                                      .where((item) => item.day!
                                          .toLowerCase()
                                          .startsWith(
                                              _selectedDay.toLowerCase()))
                                      .toList();

                              // Check if there are any classes for the selected day
                              if (filteredTimetable.isEmpty) {
                                return const Center(
                                  child: Text(
                                    'No schedule for this day',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              }

                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ListView.builder(
                                    itemCount: filteredTimetable.length,
                                    itemBuilder: (context, index) {
                                      final time = filteredTimetable[index];
                                      return ExtraScheduleItemWidget(
                                        item: time,
                                        isLast: index ==
                                            (filteredTimetable.length - 1),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                        ),
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
}
