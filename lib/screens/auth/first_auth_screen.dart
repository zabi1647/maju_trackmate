import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/screens/auth/login_screen.dart';
import 'package:maju_trackmate/screens/splash_screen.dart';
import 'package:maju_trackmate/utils/buttons/first_auth_button.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:stroke_text/stroke_text.dart';

class FirstAuthScreen extends StatefulWidget {
  const FirstAuthScreen({super.key});

  @override
  State<FirstAuthScreen> createState() => _FirstAuthScreenState();
}

class _FirstAuthScreenState extends State<FirstAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: mq.height * 0.9,
          width: mq.width * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
                offset: Offset(1, 2),
              ),
            ],
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: mq.height * 0.1,
                foregroundImage: const AssetImage('assets/png/logo/logo.png'),
              ),
              SizedBox(height: mq.height * 0.05),
              const StrokeText(
                text: "MAJU TRACKMATE",
                textStyle: TextStyle(fontSize: 30),
                textColor: Colors.black,
              ),
              SizedBox(height: mq.height * 0.01),
              // ignore: prefer_const_constructors
              Divider(
                color: Colors.black,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: mq.height * 0.02),
              firstAuthButton("assets/png/icons/student.png", "Student Portal",
                  const Color(0xffF81919), () {
                Get.to(() => const LoginScreen(
                      type: "Student",
                    ));
              }),
              SizedBox(height: mq.height * 0.02),
              firstAuthButton("assets/png/icons/faculity.png", "Faculty Portal",
                  const Color(0xff000000), () {
                Get.to(() => const LoginScreen(
                      type: "Faculty",
                    ));
              }),
              SizedBox(height: mq.height * 0.02),
              firstAuthButton("assets/png/icons/admin.png", "Admin Portal",
                  const Color(0xff144B74), () {
                Get.to(() => const LoginScreen(
                      type: "Admin",
                    ));
              }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Get.to(() => const SplashScreen());
                },
                child: const Text(
                  "Back to",
                  style: TextStyle(
                      color: Color(0xff144B74),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
