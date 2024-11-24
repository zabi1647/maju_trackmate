import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/screens/student/homepage/home_page_screens/events_screen.dart';
import 'package:maju_trackmate/screens/student/homepage/home_page_screens/news_screen.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AdminNewsEventScreen extends StatefulWidget {
  const AdminNewsEventScreen({super.key});

  @override
  State<AdminNewsEventScreen> createState() => _AdminNewsEventScreenState();
}

class _AdminNewsEventScreenState extends State<AdminNewsEventScreen> {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/png/icons/student/events.png',
                      height: mq.height * 0.07,
                    ),
                    const Text(
                      'News & Events',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Semantics(
                button: true,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const NewsScreenStudent());
                  },
                  child: Container(
                    height: mq.height * 0.08,
                    width: mq.width * 0.8,
                    decoration: BoxDecoration(
                      color: const Color(0xff0D4065),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: mq.width * 0.03,
                        ),
                        Image.asset(
                          'assets/png/icons/student/newspic.png',
                          height: mq.height * 0.07,
                        ),
                        const Text("News",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              Semantics(
                button: true,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const EventsScreen());
                  },
                  child: Container(
                    height: mq.height * 0.08,
                    width: mq.width * 0.8,
                    decoration: BoxDecoration(
                      color: const Color(0xff0D4065),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: mq.width * 0.03,
                        ),
                        Image.asset(
                          'assets/png/icons/student/eventpic.png',
                          height: mq.height * 0.07,
                        ),
                        const Text(
                          "Events",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
