import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/admin/add_new_activity.dart';
import 'package:maju_trackmate/apis/student/get_calendaer_data.dart';
import 'package:maju_trackmate/screens/admin/home_page.dart/home_page_screen.dart/add_new_activity.dart';
import 'package:maju_trackmate/screens/admin/home_page.dart/home_page_screen.dart/edit_new_activity.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

import '../../../../utils/constant_values/size.dart';

class AdminAcademicCalender extends StatefulWidget {
  const AdminAcademicCalender({super.key});

  @override
  State<AdminAcademicCalender> createState() => _AdminAcademicCalenderState();
}

class _AdminAcademicCalenderState extends State<AdminAcademicCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0D4065),
        foregroundColor: Colors.white,
        actions: [
          getLogoutButton(),
        ],
      ),
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
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Academic \nCalender",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ImageIcon(
                          AssetImage(
                              "assets/png/icons/student/calender_icon.png"),
                          size: 80,
                          color: Colors.white,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              FutureBuilder(
                  future: GetCalenderData().fetchCalenderData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text("Error");
                    } else {
                      return Column(
                        children: [
                          Text(
                            "Academic Calender ${snapshot.data!.semester!}",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Table(
                              border: TableBorder.all(
                                  color: const Color(0xff0D4065)),
                              columnWidths: const {
                                0: FractionColumnWidth(0.1),
                                1: FractionColumnWidth(0.5),
                                2: FractionColumnWidth(0.2),
                                3: FractionColumnWidth(0.2),
                              },
                              children: [
                                const TableRow(
                                  decoration:
                                      BoxDecoration(color: Color(0xff0D4065)),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Activity",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Date",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Actions",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),

                                // Course Rows
                                ...snapshot.data!.calendar!
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  final cal = entry.value;
                                  return TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${index + 1}",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          cal.title ?? "",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          cal.startDate ?? "",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      IconButton(
                                        // ignore: prefer_const_constructors
                                        icon: Icon(Icons.more_vert),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                    title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          "Select",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff0D4065),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            icon: const Icon(
                                                              Icons.close,
                                                              color: Colors.red,
                                                            ))
                                                      ],
                                                    ),
                                                    content: SizedBox(
                                                      width: mq.width * 0.2,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                final result =
                                                                    await Get.to(
                                                                        () =>
                                                                            EditNewActivity(
                                                                              year: snapshot.data!.semester!,
                                                                              calendar: cal,
                                                                            ));
                                                                if (result ==
                                                                    true) {
                                                                  // Trigger a refresh
                                                                  setState(
                                                                      () {});
                                                                }
                                                              },
                                                              style:
                                                                  ButtonStyle(
                                                                      backgroundColor:
                                                                          const WidgetStatePropertyAll(
                                                                        Color(
                                                                            0xff0D4065),
                                                                      ),
                                                                      shape:
                                                                          WidgetStatePropertyAll(
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                      )),
                                                              child: const Text(
                                                                "Edit",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),

                                                          //
                                                          // Delete Button
                                                          //
                                                          ElevatedButton(
                                                              onPressed:
                                                                  () async {
                                                                bool value =
                                                                    await AddNewActivityApi()
                                                                        .deleteActivity(
                                                                  cal.calendarEventId
                                                                      .toString(),
                                                                );

                                                                if (value) {
                                                                  setState(
                                                                      () {});
                                                                  Get.back();
                                                                }
                                                              },
                                                              style:
                                                                  ButtonStyle(
                                                                      backgroundColor:
                                                                          const WidgetStatePropertyAll(
                                                                        Color(
                                                                            0xff0D4065),
                                                                      ),
                                                                      shape:
                                                                          WidgetStatePropertyAll(
                                                                        RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                        ),
                                                                      )),
                                                              child: const Text(
                                                                "Delete",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .redAccent,
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                        },
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          SizedBox(
                            height: mq.height * 0.05,
                            width: mq.width * 0.5,
                            child: ElevatedButton(
                              onPressed: () async {
                                final result =
                                    await Get.to(() => AddNewActivity(
                                          year: snapshot.data!.semester!,
                                        ));
                                if (result == true) {
                                  // Trigger a refresh
                                  setState(() {});
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: const WidgetStatePropertyAll(
                                    Color(0xff0D4065)),
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Add New Activity",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      )),
    );
  }
}
