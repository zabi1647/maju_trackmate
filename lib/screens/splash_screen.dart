import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/screens/admin/admin_landing_page.dart';
import 'package:maju_trackmate/screens/auth/first_auth_screen.dart';
import 'package:maju_trackmate/screens/faculty/faculity_landing_page.dart';
import 'package:maju_trackmate/screens/student/student_landing_page.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff0D4065),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 100,
              foregroundImage: AssetImage('assets/png/logo/logo.png'),
            ),
            const Text("MAJU",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            const Text("TRACKMATE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final int userType = prefs.getInt('type') ?? 0;
                  final bool isUserLoggedIn = prefs.getBool('login') ?? false;

                  if (isUserLoggedIn) {
                    if (userType == 0) {
                      Get.to(() => const StudentLandingPageController());
                    } else if (userType == 1) {
                      Get.to(() => const AdminLandingPage());
                    } else if (userType == 2) {
                      Get.to(() => const FaculityLandingPage());
                    } else {
                      Get.to(() => const FirstAuthScreen());
                    }
                  } else {
                    Get.to(() => const FirstAuthScreen());
                  }
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
