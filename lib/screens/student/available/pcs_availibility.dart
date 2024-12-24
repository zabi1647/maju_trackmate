import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/model/student_classes/available/available_classes_data.dart';
import 'package:maju_trackmate/screens/student/available/book_pc.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class PcsAvailibility extends StatefulWidget {
  final List<Pcs>? pcs;
  const PcsAvailibility({super.key, required this.pcs});

  @override
  State<PcsAvailibility> createState() => _PcsAvailibilityState();
}

class _PcsAvailibilityState extends State<PcsAvailibility> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0D4065),
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [getLogoutButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/png/icons/student/computer.png',
                    ),
                    const Text(
                      'Pcs Availibility',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  border: TableBorder.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  columnWidths: const {
                    0: FractionColumnWidth(0.15),
                    1: FractionColumnWidth(0.3),
                    2: FractionColumnWidth(0.15),
                    3: FractionColumnWidth(0.15),
                    4: FractionColumnWidth(0.2),
                  },
                  children: [
                    // Header Row
                    // ignore: prefer_const_constructors
                    TableRow(
                      decoration: const BoxDecoration(
                        color: Color(0xff0D4065),
                      ),
                      children: const [
                        Text(
                          "Number",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Personal Computers",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "In Use",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Free",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Book",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    // Dynamic Data Rows
                    if (widget.pcs != null && widget.pcs!.isNotEmpty)
                      ...widget.pcs!.map((pc) => TableRow(
                            children: [
                              Text(
                                pc.pcName!,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "PC${pc.pcName!}",
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: !pc.isAvailable!
                                          ? Colors.red
                                          : Colors.grey[100],
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                      color: pc.isAvailable!
                                          ? Colors.green
                                          : Colors.grey[100],
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.black)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (pc.isAvailable!) {
                                    Get.to(() => BookPc(
                                          pcId: pc.pcName!,
                                        ));
                                  }
                                },
                                child: const Text(
                                  "Pc Reg.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
