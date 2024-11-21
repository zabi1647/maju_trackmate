import 'package:get/get.dart';
import 'package:maju_trackmate/screens/student/available/available_screen.dart';
import 'package:maju_trackmate/screens/student/extra_mile/extra_mile_screen.dart';
import 'package:maju_trackmate/screens/student/homepage/home_page_screen.dart';
import 'package:maju_trackmate/screens/student/leave/leave_screen.dart';
import 'package:maju_trackmate/screens/student/transcript/transcript_screen.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 2.obs;
  final screens = [
    const LeaveScreen(),
    const ExtraMileScreen(),
    const HomePageScreen(),
    AvailableScreen(),
    const TranscriptScreen(),
  ];

  void onDestinationSelected(int index) async {
    selectedIndex.value = index;
  }
}
