import 'package:flutter/material.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AddNewActivity extends StatefulWidget {
  const AddNewActivity({super.key});

  @override
  State<AddNewActivity> createState() => _AddNewActivityState();
}

class _AddNewActivityState extends State<AddNewActivity> {
  final activityNameController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final yearController = TextEditingController();
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
          child: SingleChildScrollView(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Academic Calendar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/png/icons/student/events.png',
                        height: mq.height * 0.07,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                const Text(
                  "Academic Calendar SP22",
                  style: TextStyle(
                    color: Color(0xff0D4065),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                const Text(
                  "Add new Activity",
                  style: TextStyle(
                    color: Color(0xff0D4065),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: const Divider(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: TextFormField(
                    controller: activityNameController,
                    decoration: const InputDecoration(
                      labelText: 'Activity Name',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: Row(
                    children: [
                      SizedBox(
                        width: mq.width * 0.39,
                        child: TextFormField(
                          controller: dateController,
                          decoration: const InputDecoration(
                            labelText: 'Date',
                            labelStyle: TextStyle(
                              color: Color(0xff0D4065),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mq.width * 0.02,
                      ),
                      SizedBox(
                        width: mq.width * 0.39,
                        child: TextFormField(
                          controller: timeController,
                          decoration: const InputDecoration(
                            labelText: 'Time',
                            labelStyle: TextStyle(
                              color: Color(0xff0D4065),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: TextFormField(
                    controller: yearController,
                    decoration: const InputDecoration(
                      labelText: 'Year',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.03,
                ),
                SizedBox(
                  height: mq.height * 0.05,
                  width: mq.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () {},
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
              ],
            ),
          ),
        ),
      )),
    );
  }
}
