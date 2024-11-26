import 'package:get/get.dart';
import 'package:maju_trackmate/screens/admin/extra_class/extra_class_request_page.dart';
import 'package:maju_trackmate/screens/admin/home_page.dart/admin_home_page.dart';
import 'package:maju_trackmate/screens/student/available/available_screen.dart';

class AdminLandingPageController extends GetxController {
  final Rx<int> selectedIndex = 1.obs;
  final screens = [
    const ExtraClassRequestPage(),
    const AdminHomePageScreen(),
    AvailableScreen(),
  ];

  void onDestinationSelected(int index) async {
    selectedIndex.value = index;
  }
}
