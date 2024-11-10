import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/screens/auth/first_auth_screen.dart';
import 'package:maju_trackmate/screens/student/student_landing_page.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';

class LoginScreen extends StatefulWidget {
  final String type;
  const LoginScreen({super.key, required this.type});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              height: mq.height,
              child: Column(
                children: [
                  Container(
                    height: mq.height * 0.35,
                    width: mq.width,
                    decoration: const BoxDecoration(
                      color: Color(0xff0D4065),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${widget.type} Login",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: mq.height * 0.05),
                  const Text(
                    "Login",
                    style: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: mq.height * 0.05),
                  SizedBox(
                    width: mq.width * 0.8,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Email",
                        prefixIcon: const ImageIcon(
                          AssetImage("assets/png/icons/people_.png"),
                          color: Colors.blue,
                        ),
                        labelStyle: const TextStyle(color: Color(0xff0D4065)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mq.height * 0.05),
                  SizedBox(
                    width: mq.width * 0.8,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
                        prefixIcon: const ImageIcon(
                          AssetImage("assets/png/icons/Group.png"),
                          color: Colors.blue,
                        ),
                        labelStyle: const TextStyle(color: Color(0xff0D4065)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: mq.height * 0.05),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.off(() => const StudentLandingPageController());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0D4065),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(24),
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const FirstAuthScreen());
                    },
                    child: const Text(
                      "Back to Home",
                      style: TextStyle(
                          color: Color(0xff0D4065),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
