import 'package:flutter/material.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AttendancePageScreen extends StatefulWidget {
  const AttendancePageScreen({super.key});

  @override
  State<AttendancePageScreen> createState() => _AttendancePageScreenState();
}

class _AttendancePageScreenState extends State<AttendancePageScreen> {
  // Booleans to manage visibility of containers
  bool dayAndTime = false;
  bool courseAndSecion = false;

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

                // Extra Curricular Activities Container
                if (dayAndTime)
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
                            child: Text("day"),
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
                        courseAndSecion = !courseAndSecion;
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

                // Extra Class Notification Container
                if (courseAndSecion)
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
                      children: [],
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
