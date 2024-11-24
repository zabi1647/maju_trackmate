import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/controller/admin_landing_page_controller.dart';

class AdminLandingPage extends StatelessWidget {
  const AdminLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminLandingPageController());
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
                AssetImage('assets/png/icons/student/available.png'),
                size: 40,
              ),
              label: 'Availability',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
