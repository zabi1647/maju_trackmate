import 'package:flutter/material.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
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
                    Text(
                      "0RS",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
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
              Container(
                height: mq.height * 0.07,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Color(0xff0D4065)),
                ),
                child: const Center(
                  child: Text(
                    "Information and Network security",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              Container(
                height: mq.height * 0.05,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: const Color(0xff0D4065)),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Class Held Date",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          "Attendance status",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: mq.height * 0.2,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: mq.height * 0.01,
                    ),
                    getRow("08-03-2024", "Average Absent"),
                    SizedBox(
                      height: mq.height * 0.01,
                    ),
                    getRow("08-03-2024", "Average Absent"),
                    SizedBox(
                      height: mq.height * 0.01,
                    ),
                    getRow("08-03-2024", "Average Absent"),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              Container(
                height: mq.height * 0.07,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Color(0xff0D4065)),
                ),
                child: const Center(
                  child: Text(
                    "Software Re-engineering",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget getRow(String first, String second) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Text(
            first,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Text(
            second,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.yellow),
          ),
        ),
      ],
    );
  }
}
