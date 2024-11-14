import 'package:flutter/material.dart';
import 'package:maju_trackmate/controller/apis/student/get_extra_curricular_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
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
                              borderRadius: BorderRadius.only(
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
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: FutureBuilder(
                                future: GetExtraCurricularData().fetchData(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  } else if (snapshot.hasError) {
                                    return Center(
                                      child: Text("error"),
                                    );
                                  } else {
                                    if (snapshot.data?.activities?.isEmpty ??
                                        snapshot.data?.activities == null) {
                                      return Center(
                                        child: Text("No activities found"),
                                      );
                                    } else {
                                      return ListView.builder(
                                          itemCount: snapshot
                                                  .data?.activities?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                top: 20,
                                              ),
                                              child: Text(
                                                  "${snapshot.data?.activities?[index].title} "),
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
                    width: mq.width * 0.9,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange[50],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange),
                    ),
                    child: const Text(
                      'Details about Extra Classes go here...',
                      style: TextStyle(fontSize: 16, color: Colors.black),
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
