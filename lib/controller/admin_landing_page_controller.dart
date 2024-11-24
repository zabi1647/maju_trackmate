import 'package:get/get.dart';
import 'package:maju_trackmate/screens/student/available/available_screen.dart';
import 'package:maju_trackmate/screens/student/extra_mile/extra_mile_screen.dart';
import 'package:maju_trackmate/screens/student/homepage/home_page_screen.dart';

class AdminLandingPageController extends GetxController {
  final Rx<int> selectedIndex = 1.obs;
  final screens = [
    const ExtraMileScreen(),
    const HomePageScreen(),
    AvailableScreen(),
  ];

  void onDestinationSelected(int index) async {
    selectedIndex.value = index;
  }
}
