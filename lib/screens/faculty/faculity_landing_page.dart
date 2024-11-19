import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/controller/student_landing_page_controller.dart';

class FaculityLandingPage extends StatelessWidget {
  const FaculityLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 60,
          elevation: 0,
          indicatorColor: const Color.fromARGB(255, 213, 179, 119),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.onDestinationSelected(index),
          destinations: const [
            NavigationDestination(
              icon: ImageIcon(
                  AssetImage('assets/png/icons/student/calender.png')),
              label: 'Leave',
            ),
            NavigationDestination(
              icon: ImageIcon(AssetImage('assets/png/icons/student/mile.png')),
              label: 'Extra Mile',
            ),
            NavigationDestination(
              icon: ImageIcon(AssetImage('assets/png/icons/student/home.png')),
              label: 'Home',
            ),
            NavigationDestination(
              icon: ImageIcon(
                  AssetImage('assets/png/icons/student/available.png')),
              label: 'Available',
            ),
            NavigationDestination(
              icon: ImageIcon(
                  AssetImage('assets/png/icons/student/transcript.png')),
              label: 'Transcript',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
