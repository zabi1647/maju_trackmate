import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/faculty/request_make_up_lecture.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class ExtraClassRequestScreen extends StatefulWidget {
  const ExtraClassRequestScreen({
    super.key,
  });

  @override
  State<ExtraClassRequestScreen> createState() =>
      _ExtraClassRequestScreenState();
}

class _ExtraClassRequestScreenState extends State<ExtraClassRequestScreen> {
  final classNameController = TextEditingController();
  final courseController = TextEditingController();
  final dayController = TextEditingController();
  final blockNameController = TextEditingController();
  final roomController = TextEditingController();
  final List<String> _timeSlots = ['08:30-10:00', '10:00-11:30', '11:30-02:30'];
  String? _selectedTimeSlot;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0D4065),
        automaticallyImplyLeading: false,
        foregroundColor: Colors.white,
        actions: [
          getLogoutButton(),
        ],
      ),
      body: SafeArea(
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
                      'Extra Class \nRequest',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: mq.width * 0.3,
                      height: mq.height * 0.1,
                      child: Image.asset(
                        'assets/png/icons/student/extra_request.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Container(
                width: mq.width * 0.96,
                height: mq.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xff0D4065),
                    width: 2,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        "Request",
                        style: TextStyle(
                          color: Color(0xff0D4065),
                          fontSize: 20,
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
                          controller: classNameController,
                          decoration: const InputDecoration(
                            labelText: 'Class',
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
                        child: TextFormField(
                          controller: courseController,
                          decoration: const InputDecoration(
                            labelText: 'Course code',
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
                        child: TextFormField(
                          controller: dayController,
                          decoration: const InputDecoration(
                            labelText: 'Day',
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
                        child: TextFormField(
                          controller: blockNameController,
                          decoration: const InputDecoration(
                            labelText: 'Block name',
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
                        child: TextFormField(
                          controller: roomController,
                          decoration: const InputDecoration(
                            labelText: 'Room',
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
                        height: mq.height * 0.02,
                      ),
                      SizedBox(
                        width: mq.width * 0.8,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Select Time Slot',
                            labelStyle: const TextStyle(
                              color: Color(0xff0D4065),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          value: _selectedTimeSlot,
                          items: _timeSlots
                              .map((slot) => DropdownMenuItem<String>(
                                    value: slot,
                                    child: Text(slot),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedTimeSlot = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: mq.height * 0.03),
                      SizedBox(
                        height: mq.height * 0.05,
                        width: mq.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (classNameController.text.isEmpty ||
                                courseController.text.isEmpty ||
                                dayController.text.isEmpty ||
                                blockNameController.text.isEmpty ||
                                roomController.text.isEmpty ||
                                _selectedTimeSlot == null) {
                              MyDialogs.error(
                                  msg:
                                      "Please fill all the fields before submitting");
                            } else {
                              bool value =
                                  await RequestMakeUpLecture().addLecture(
                                classNameController.text,
                                courseController.text,
                                dayController.text,
                                blockNameController.text,
                                roomController.text,
                                _selectedTimeSlot!.split('-')[0],
                                _selectedTimeSlot!.split('-')[1],
                              );
                              if (value) {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: const Text(
                                            "Request Submitted",
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
                                                  classNameController.clear();
                                                  courseController.clear();
                                                  dayController.clear();
                                                  blockNameController.clear();
                                                  roomController.clear();
                                                  setState(() {
                                                    _selectedTimeSlot = null;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        const WidgetStatePropertyAll(
                                                      Color(0xff0D4065),
                                                    ),
                                                    shape:
                                                        WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    )),
                                                child: const Text(
                                                  "Ok",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
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
            ],
          ),
        ),
      )),
    );
  }
}
