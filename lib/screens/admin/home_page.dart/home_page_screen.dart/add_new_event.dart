import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/admin/add_new_event.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
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
  final uploadPosterController = TextEditingController();
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
    uploadPosterController.dispose();

    registrationController.dispose();
    participtionController.dispose();
    linkedInController.dispose();

    dayController.dispose();
    timeController.dispose();
    venuController.dispose();
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
                SizedBox(
                  width: mq.width * 0.8,
                  child: TextFormField(
                    controller: uploadPosterController,
                    decoration: const InputDecoration(
                      labelText: 'Upload poster',
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
                        uploadPosterController.text,
                        "",
                        dayController.text,
                        timeController.text,
                        venuController.text,
                        registrationController.text,
                        participtionController.text,
                        linkedInController.text,
                      );
                      if (result) {
                        MyDialogs.success(msg: "Event added successfully");
                      } else {
                        MyDialogs.error(msg: "Failed to add event");
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
