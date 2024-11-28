import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/controller/faculty_controller.dart';

class FaculityLandingPage extends StatelessWidget {
  const FaculityLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FacultyController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          indicatorColor: const Color.fromARGB(255, 97, 107, 222),
          indicatorShape: ShapeBorder.lerp(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            1,
          ),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.onDestinationSelected(index),
          destinations: const [
            NavigationDestination(
              icon: ImageIcon(
                AssetImage('assets/png/icons/student/mile.png'),
                size: 40,
              ),
              label: 'Extra Class Request',
            ),
            NavigationDestination(
              icon: ImageIcon(
                AssetImage('assets/png/icons/student/home.png'),
                size: 40,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: ImageIcon(
                AssetImage('assets/png/icons/student/calender.png'),
                size: 40,
              ),
              label: 'Attendance',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
