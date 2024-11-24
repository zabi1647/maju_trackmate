import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/student/get_attendance_data.dart';
import 'package:maju_trackmate/controller/student_rooms_controller.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  final AvailableRoomsController controller =
      Get.put(AvailableRoomsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Text("Leave",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30)),
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 35,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: mq.height * 0.02,
                    ),
                    const Text(
                      "0RS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Total Absent fine due",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              SizedBox(
                height: mq.height * 0.8,
                child: FutureBuilder(
                  future: GetAttendanceData().fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error fetching data"),
                      );
                    } else {
                      if (snapshot.data?.attendance?.isEmpty ?? true) {
                        return const Center(
                          child: Text("No activities found"),
                        );
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data?.attendance?.length ?? 0,
                          itemBuilder: (context, index) {
                            final block = snapshot
                                .data!.attendance![index].attendance![index];

                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.toggleBlock(index);
                                  },
                                  child: Container(
                                    height: mq.height * 0.07,
                                    width: mq.width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: const Color(0xff0D4065)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.attendance![index]
                                            .attendance![index].courseName!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),

                                // Use Obx to reactively rebuild when expanded state changes
                                Obx(() {
                                  if (controller.expandedBlocks[index] ??
                                      false) {
                                    return Container(
                                      width: mq.width * 0.9,
                                      height: mq.height * 0.3,
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
                                              border: Border.all(
                                                  color: Colors.black),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 8.0),
                                                    child: Text(
                                                      "Class Held Date",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8.0),
                                                    child: Text(
                                                      "Attendance status",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: mq.height * 0.24,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20),
                                              ),
                                            ),
                                            child: ListView.builder(
                                              itemCount:
                                                  block.absents?.length ?? 0,
                                              itemBuilder: (context, i) {
                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 12.0),
                                                      child: Text(
                                                        block.absents![i]
                                                            .absentDate!,
                                                        style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    if (block.absents!.length <=
                                                        1)
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 12.0),
                                                        child: Text(
                                                          "Absent",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    if (block.absents!.length <=
                                                            3 &&
                                                        block.absents!.length >
                                                            1)
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 12.0),
                                                        child: Text(
                                                          "Average Absent",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .yellow),
                                                        ),
                                                      ),
                                                    if (block.absents!.length >
                                                        3)
                                                      // ignore: prefer_const_constructors
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 12.0),
                                                        child: const Text(
                                                          "Danger Absent",
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return const SizedBox.shrink();
                                  }
                                }),
                              ],
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
