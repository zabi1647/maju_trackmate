import 'dart:io';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/admin/add_new_event.dart';
import 'package:maju_trackmate/model/student_classes/home_page/events_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class EditEventScreen extends StatefulWidget {
  final Events? event;
  const EditEventScreen({
    super.key,
    this.event,
  });

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  final newsTitleController = TextEditingController();
  final descriptionController = TextEditingController();
  File? _file;
  final registrationController = TextEditingController();
  final participtionController = TextEditingController();
  final linkedInController = TextEditingController();
  final dayController = TextEditingController();
  final timeController = TextEditingController();
  final venuController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsTitleController.text = widget.event!.title!;
    descriptionController.text = widget.event!.description!;
    registrationController.text = widget.event!.registration!;
    participtionController.text = widget.event!.participationRegistration!;
    linkedInController.text = widget.event!.linkedin!;
    dayController.text = widget.event!.date!;
    timeController.text = widget.event!.time!;
    venuController.text = widget.event!.venue!;
  }

  @override
  void dispose() {
    super.dispose();
    newsTitleController.dispose();

    registrationController.dispose();
    participtionController.dispose();
    linkedInController.dispose();

    dayController.dispose();
    timeController.dispose();
    venuController.dispose();
  }

  Future<void> _pickFile(Function(File) onFilePicked) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);
      onFilePicked(file);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select a file'),
      ));
    }
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: mq.width * 0.3,
                        height: mq.height * 0.1,
                        child: Image.asset(
                          'assets/png/icons/student/events.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'Edit Event',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                const Text(
                  "Maju Event",
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
                    controller: newsTitleController,
                    decoration: const InputDecoration(
                      labelText: 'Event title',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 14,
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
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Event desctiption',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 14,
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
                    controller: registrationController,
                    decoration: const InputDecoration(
                      labelText: 'Registration Link',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 14,
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
                    controller: participtionController,
                    decoration: const InputDecoration(
                      labelText: 'Participation Link',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 14,
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
                    controller: linkedInController,
                    decoration: const InputDecoration(
                      labelText: 'LinkedIn Link',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 14,
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
                Container(
                  height: mq.height * 0.06,
                  width: mq.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Semantics(
                        button: true,
                        child: InkWell(
                          onTap: () {
                            _pickFile((file) => setState(() {
                                  _file = file;
                                }));
                          },
                          child: Container(
                            height: mq.height * 0.06,
                            width: mq.width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Center(child: Text("Choose File")),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: _file == null
                                ? const Text("No file selected")
                                : Text(_file!.path.split('/').last),
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
                  child: InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate:
                            DateTime(2000), // Set a minimum date if needed
                        lastDate:
                            DateTime(2100), // Set a maximum date if needed
                      );
                      if (pickedDate != null) {
                        final formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        setState(() {
                          dayController.text =
                              formattedDate; // Update the controller
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: dayController,
                        decoration: const InputDecoration(
                          labelText: 'Select Date',
                          labelStyle: TextStyle(
                            color: Color(0xff0D4065),
                            fontSize: 14,
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
                  ),
                ),

                SizedBox(
                  height: mq.height * 0.01,
                ),
                // Add this for custom time formatting

                SizedBox(
                  width: mq.width * 0.8,
                  child: InkWell(
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        builder: (BuildContext context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          );
                        },
                      );
                      if (pickedTime != null) {
                        // Format time to 24-hour format (e.g., 23:04)
                        final now = DateTime.now();
                        final formattedTime =
                            DateFormat('HH:mm').format(DateTime(
                          now.year,
                          now.month,
                          now.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        ));
                        setState(() {
                          timeController.text =
                              formattedTime; // Update the controller
                        });
                      }
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: timeController,
                        decoration: const InputDecoration(
                          labelText: 'Select Time',
                          labelStyle: TextStyle(
                            color: Color(0xff0D4065),
                            fontSize: 14,
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
                  ),
                ),

                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: TextFormField(
                    controller: venuController,
                    decoration: const InputDecoration(
                      labelText: 'venue',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 14,
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
                      final addNewEventApi = AddNewEventApi();
                      final result = await addNewEventApi.editEvent(
                        widget.event!.eventId.toString(),
                        newsTitleController.text,
                        descriptionController.text,
                        _file!,
                        "",
                        dayController.text,
                        timeController.text,
                        venuController.text,
                        registrationController.text,
                        participtionController.text,
                        linkedInController.text,
                      );
                      if (result) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const Text(
                                    "New Event is Added",
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
                      "Edit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
