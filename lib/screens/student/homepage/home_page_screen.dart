import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/model/student_classes/class_schedual.dart';
import 'package:maju_trackmate/model/student_classes/todo_item.dart';
import 'package:maju_trackmate/screens/student/homepage/home_page_screens/profile_screen.dart';
import 'package:maju_trackmate/utils/constant_values/get_weekday.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/classes_timing_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  // Content for each day
  final Map<String, List<ScheduleItem>> daySchedules = {
    'Mon': [
      ScheduleItem('10:00AM', '11:30AM', 'Software Re-Engineering', 'CG-C8'),
      ScheduleItem(
          '11:30AM', '01:00PM', 'Information & Network Security', 'CG-C6'),
    ],
    'Tue': [
      ScheduleItem('09:00AM', '10:30AM', 'Data Structures', 'CG-A3'),
      ScheduleItem('11:00AM', '12:30PM', 'Machine Learning', 'CG-B5'),
    ],
    'Wed': [
      ScheduleItem('10:30AM', '12:00PM', 'Cloud Computing', 'CG-D2'),
      ScheduleItem('02:00PM', '03:30PM', 'Artificial Intelligence', 'CG-E7'),
    ],
    // Add schedules for other days
    'Thu': [],
    'Fri': [],
    'Sat': [],
    'Sun': [],
  };

  // Track the selected day
  String _selectedDay = 'Mon';

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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "MAJU TRACKMATE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: mq.width * 0.02,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 35,
                            )),
                      ],
                    ),
                    // SizedBox(
                    //   height: mq.height * 0.02,
                    // ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const ProfileScreen());
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
                height: mq.height * 0.01,
              ),
              Container(
                height: mq.height * 0.34,
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Text(
                            "Time Table",
                            style: TextStyle(
                                color: Color(0xff0D4065),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Spacer(),
                          ImageIcon(
                            AssetImage(
                                "assets/png/icons/student/calender_icon.png"),
                            size: 50,
                            color: Color(0xff0D4065),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.003,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: weekdays
                            .map((day) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDay = day;
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: _selectedDay == day
                                          ? Colors.blue
                                          : Colors.grey[300],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      day,
                                      style: TextStyle(
                                        color: _selectedDay == day
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: _selectedDay == day
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: daySchedules[_selectedDay]!.isNotEmpty
                            ? ListView.builder(
                                itemCount: daySchedules[_selectedDay]!.length,
                                itemBuilder: (context, index) {
                                  return ScheduleItemWidget(
                                    item: daySchedules[_selectedDay]![index],
                                    isLast: index ==
                                        daySchedules[_selectedDay]!.length - 1,
                                  );
                                },
                              )
                            : const Center(
                                child: Text(
                                  'No schedule for this day',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: mq.height * 0.1,
                    width: mq.width * 0.43,
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
                            const Text("Academic \nCalendar",
                                style: TextStyle(
                                    color: Color(0xff0D4065),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: mq.width * 0.2,
                              child: const Divider(
                                color: Colors.red,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const ImageIcon(
                            AssetImage(
                                "assets/png/icons/student/calender_icon.png"),
                          ),
                          iconSize: 50,
                          color: const Color(0xff0D4065),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: mq.height * 0.1,
                    width: mq.width * 0.43,
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
                            const Text("News & \nEvents",
                                style: TextStyle(
                                    color: Color(0xff0D4065),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: mq.width * 0.2,
                              child: const Divider(
                                color: Colors.red,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const ImageIcon(
                            AssetImage("assets/png/icons/student/speaker.png"),
                          ),
                          iconSize: 50,
                          color: const Color(0xff0D4065),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              Container(
                height: mq.height * 0.2,
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
