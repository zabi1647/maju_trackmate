import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/faculty/get_faculty_profile_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color(0xff0D4065),
          foregroundColor: Colors.white,
          actions: [
            getLogoutButton(),
          ]),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
            future: GetFacultyProfileData().fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Column(
                  children: [
                    Container(
                      height: mq.height * 0.22,
                      width: mq.width,
                      decoration: const BoxDecoration(
                        color: Color(0xff0D4065),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: mq.width * 0.05),
                              const Text("Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Image.asset(
                            'assets/png/icons/student/profile.png',
                            height: mq.height * 0.07,
                          ),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          Text(
                            '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          Text(
                            '${snapshot.data!.username}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.01,
                    ),
                    Container(
                      height: mq.height * 0.6,
                      width: mq.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getRow('FATHER NAME', '--'),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          getRow('FATHER OCCUPATION', '--'),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          getRow('First Name', '${snapshot.data!.firstName}'),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          getRow('Last Name', '${snapshot.data!.lastName}'),
                          getRow('PASSPORT NUMBER', '--'),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          getRow('PERMANENT ADDRESS', '--'),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          getRow('PERMANENT CITY', '-'),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          getRow('PHONE', '${snapshot.data!.phone}'),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                          getRow('EMAIL', '${snapshot.data!.email}'),
                          SizedBox(
                            height: mq.height * 0.01,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      )),
    );
  }

  Widget getRow(String first, String second) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            first,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            second,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
