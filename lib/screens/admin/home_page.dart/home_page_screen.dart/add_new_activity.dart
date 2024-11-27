import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/admin/add_new_activity.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AddNewActivity extends StatefulWidget {
  final String year;
  const AddNewActivity({super.key, required this.year});

  @override
  State<AddNewActivity> createState() => _AddNewActivityState();
}

class _AddNewActivityState extends State<AddNewActivity> {
  final activityNameController = TextEditingController();
  final dateController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    activityNameController.dispose();
    dateController.dispose();
    monthController.dispose();
    yearController.dispose();
  }

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
                Text(
                  "Academic Calendar ${widget.year}",
                  style: const TextStyle(
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
                      labelText: 'Activity',
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
                          controller: monthController,
                          decoration: const InputDecoration(
                            labelText: 'Month',
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
                    onPressed: () async {
                      if (activityNameController.text.isEmpty ||
                          dateController.text.isEmpty ||
                          monthController.text.isEmpty ||
                          yearController.text.isEmpty) {
                        MyDialogs.error(
                            msg:
                                "Activity name, date, month and year are required");
                      } else {
                        bool value = await AddNewActivityApi().addActivity(
                          widget.year,
                          activityNameController.text,
                          "${dateController.text}-${monthController.text}-${yearController.text}",
                        );
                        if (value) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text(
                                      "New Activity is Added",
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
                                            Navigator.pop(
                                                context); // Close the dialog
                                            Get.back(result: true);
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
                      }
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
              ],
            ),
          ),
        ),
      )),
    );
  }
}
