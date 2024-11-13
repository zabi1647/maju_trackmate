import 'package:flutter/material.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class ExtraMileScreen extends StatefulWidget {
  const ExtraMileScreen({super.key});

  @override
  State<ExtraMileScreen> createState() => _ExtraMileScreenState();
}

class _ExtraMileScreenState extends State<ExtraMileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: mq.height * 0.2,
                width: mq.width,
                decoration: const BoxDecoration(
                  color: Color(0xff0D4065),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: getLogoutButton(),
                    ),
                    Image.asset(
                      'assets/png/icons/student/extra_mile_image.png',
                      height: mq.height * 0.07,
                    ),
                    const Text(
                      'Extra Mile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              const Text(
                "Extra Step",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff0D4065),
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  color: Color(0xff0D4065),
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              SizedBox(
                width: mq.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(const Color(0xff0D4065)),
                  ),
                  child: const Text(
                    'Extra Curricular Activities',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.01,
              ),
              SizedBox(
                width: mq.width * 0.9,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xff0D4065)),
                    ),
                    child: const Text(
                      'Extra Class Notification',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
