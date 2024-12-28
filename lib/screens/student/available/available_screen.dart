import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/student/get_available_rooms.dart';
import 'package:maju_trackmate/apis/student/get_papers_data.dart';
import 'package:maju_trackmate/controller/student_rooms_controller.dart';
import 'package:maju_trackmate/model/student_classes/available/exams_data.dart';
import 'package:maju_trackmate/screens/student/available/pcs_availibility.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/classes_timing_widget.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AvailableScreen extends StatefulWidget {
  AvailableScreen({super.key});

  @override
  State<AvailableScreen> createState() => _AvailableScreenState();
}

class _AvailableScreenState extends State<AvailableScreen> {
  final List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  String _selectedDay = 'Mon';
  final AvailableRoomsController controller =
      Get.put(AvailableRoomsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              height: mq.height * 0.22,
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
                    'assets/png/icons/student/availiablity.png',
                    height: mq.height * 0.07,
                  ),
                  const Text(
                    'Availability',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mq.height * 0.01),

            // Content Section
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Available Rooms Section
                    FutureBuilder(
                      future: GetAvailableRooms().fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return const Center(
                              child: Text("Error fetching data"));
                        } else if (snapshot.data?.blocks?.isEmpty ?? true) {
                          return const Center(
                              child: Text("No activities found"));
                        }

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(bottom: mq.height * 0.02),
                          itemCount: snapshot.data?.blocks?.length ?? 0,
                          itemBuilder: (context, index) {
                            final block = snapshot.data?.blocks?[index];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: mq.width * 0.9,
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          controller.toggleBlock(index),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          const Color(0xff0D4065),
                                        ),
                                      ),
                                      child: Text(
                                        block?.blockName ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Obx(() {
                                    if (controller.expandedBlocks[index] ??
                                        false) {
                                      return _buildRoomsList(block);
                                    }
                                    return const SizedBox.shrink();
                                  }),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),

                    // Exams Section
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: mq.width * 0.9,
                            child: ElevatedButton(
                              onPressed: () => controller.toggleExam(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0D4065),
                              ),
                              child: const Text(
                                "Exams",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Obx(() {
                            if (controller.expandExam.value) {
                              return FutureBuilder(
                                future: GetPapersData().fetchData(),
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
                                      snapshot.data!.examTimetables.isEmpty) {
                                    return const Center(
                                      child: Text(
                                        'No schedule available',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 18,
                                        ),
                                      ),
                                    );
                                  }

                                  final ExamData examData = snapshot.data!;
                                  final List<ExamPaper> filteredTimetable =
                                      examData
                                          .examTimetables.first.examPapers
                                          .where((item) =>
                                              item.day.toLowerCase().startsWith(
                                                  _selectedDay.toLowerCase()))
                                          .toList();

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

                                  return Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: weekdays
                                              .map((day) => GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        _selectedDay = day;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8,
                                                          vertical: 8),
                                                      decoration: BoxDecoration(
                                                        color: _selectedDay ==
                                                                day
                                                            ? Colors.blue
                                                            : Colors.grey[300],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Text(
                                                          day,
                                                          style: TextStyle(
                                                            color:
                                                                _selectedDay ==
                                                                        day
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                            fontWeight:
                                                                _selectedDay ==
                                                                        day
                                                                    ? FontWeight
                                                                        .bold
                                                                    : FontWeight
                                                                        .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(16.0),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: filteredTimetable.length,
                                          itemBuilder: (context, index) {
                                            final time =
                                                filteredTimetable[index];
                                            return ExamItemWidget(
                                              item: time,
                                              isLast: index ==
                                                  (filteredTimetable.length -
                                                      1),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                            return const SizedBox.shrink();
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomsList(dynamic block) {
    return Container(
      width: mq.width * 0.9,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
                "Rooms",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: mq.height * 0.24,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: block?.rooms?.length ?? 0,
              itemBuilder: (context, i) {
                return _buildRoomItem(block, i);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoomItem(dynamic block, int i) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 20,
      ),
      child: InkWell(
        onTap: () {
          if (i == 0) {
            Get.to(() => PcsAvailibility(pcs: block!.rooms![i].pcs));
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              block?.rooms?[i].roomName ?? 'Unknown Room',
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Text(
                i == 0 ? 'Available' : 'Not Available',
                style: TextStyle(
                  color: i == 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
