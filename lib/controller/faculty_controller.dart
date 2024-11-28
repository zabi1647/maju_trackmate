import 'package:get/get.dart';
import 'package:maju_trackmate/screens/faculty/extra_class/extra_class_request_screen.dart';
import 'package:maju_trackmate/screens/faculty/home/faculty_home_page.dart';
import 'package:maju_trackmate/screens/student/available/available_screen.dart';

class FacultyController extends GetxController {
  final Rx<int> selectedIndex = 1.obs;
  final screens = [
    const ExtraClassRequestScreen(),
    const FacultyHomePage(),
    AvailableScreen(),
  ];

  void onDestinationSelected(int index) async {
    selectedIndex.value = index;
  }
}
