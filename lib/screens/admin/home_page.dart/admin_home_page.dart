import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/model/student_classes/todo_item.dart';
import 'package:maju_trackmate/screens/admin/home_page.dart/home_page_screen.dart/admin_academic_calendar.dart';
import 'package:maju_trackmate/screens/admin/home_page.dart/home_page_screen.dart/admin_news_event_screen.dart';
import 'package:maju_trackmate/screens/admin/home_page.dart/home_page_screen.dart/admin_profile_screen.dart';
import 'package:maju_trackmate/utils/constant_values/get_weekday.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AdminHomePageScreen extends StatefulWidget {
  const AdminHomePageScreen({super.key});

  @override
  State<AdminHomePageScreen> createState() => _AdminHomePageScreenState();
}

class _AdminHomePageScreenState extends State<AdminHomePageScreen> {
  List<TodoItem> _todoItems = [];

  // Text editing controller for adding new todos
  final TextEditingController _todoController = TextEditingController();

  // Method to show add todo dialog
  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Todo'),
          content: TextField(
            controller: _todoController,
            decoration: InputDecoration(
              hintText: 'Enter todo item',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _todoController.clear();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_todoController.text.isNotEmpty) {
                  setState(() {
                    _todoItems.add(TodoItem(
                      title: _todoController.text,
                      isCompleted: false,
                    ));
                    _todoController.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

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
                height: mq.height * 0.25,
                width: mq.width,
                decoration: const BoxDecoration(
                  color: Color(0xff0D4065),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "MAJU TRACKMATE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: mq.width * 0.1,
                        ),
                        getLogoutButton(),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const AdminProfileScreen());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff0D4065),
                                side: const BorderSide(
                                  width: 3.0,
                                  color: Colors.white,
                                ),
                              ),
                              child: const Text(
                                "Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mq.width * 0.3,
                        ),
                        Column(
                          children: [
                            const ImageIcon(
                              AssetImage("assets/png/icons/student/sun.png"),
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              getTodayDay(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              formatTodayDate(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Container(
                height: mq.height * 0.1,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff0D4065),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: mq.height * 0.02,
                        ),
                        const Text("Academic Calendar",
                            style: TextStyle(
                                color: Color(0xff0D4065),
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: mq.width * 0.4,
                          child: const Divider(
                            color: Colors.red,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => const AdminAcademicCalender());
                      },
                      icon: const ImageIcon(
                        AssetImage(
                            "assets/png/icons/student/calender_icon.png"),
                        size: 80,
                      ),
                      iconSize: 50,
                      color: const Color(0xff0D4065),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Container(
                height: mq.height * 0.1,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff0D4065),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: mq.height * 0.02,
                        ),
                        const Text("News & Events",
                            style: TextStyle(
                                color: Color(0xff0D4065),
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: mq.width * 0.4,
                          child: const Divider(
                            color: Colors.red,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        Get.to(() => const AdminNewsEventScreen());
                      },
                      icon: const ImageIcon(
                        AssetImage("assets/png/icons/student/speaker.png"),
                        size: 80,
                      ),
                      color: const Color(0xff0D4065),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.03,
              ),
              Container(
                height: mq.height * 0.4,
                width: mq.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff0D4065),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Header Row
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "My To Do List",
                            style: TextStyle(
                              color: Color(0xff0D4065),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: _showAddTodoDialog,
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                            color: Color(0xff0D4065),
                            size: 30,
                          ),
                        ),
                      ],
                    ),

                    // Divider
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),

                    // Todo List
                    Expanded(
                      child: _todoItems.isEmpty
                          ? const Center(
                              child: Text(
                                'No todos yet',
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          : ListView.builder(
                              itemCount: _todoItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    ". ${_todoItems[index].title}",
                                    style: TextStyle(
                                      decoration: _todoItems[index].isCompleted
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                      color: _todoItems[index].isCompleted
                                          ? Colors.grey
                                          : Colors.black,
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
