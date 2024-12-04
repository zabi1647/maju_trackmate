import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/admin/add_new_event.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AddNeweventScreen extends StatefulWidget {
  const AddNeweventScreen({
    super.key,
  });

  @override
  State<AddNeweventScreen> createState() => _AddNeweventScreenState();
}

class _AddNeweventScreenState extends State<AddNeweventScreen> {
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
                        'Add New Event',
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
                  child: TextFormField(
                    controller: dayController,
                    decoration: const InputDecoration(
                      labelText: 'Date ',
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
                    controller: timeController,
                    decoration: const InputDecoration(
                      labelText: 'time',
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
                      final result = await addNewEventApi.addEvent(
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
                      "Upload",
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
