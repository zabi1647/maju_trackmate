import 'package:flutter/material.dart';
import 'package:maju_trackmate/model/student_classes/extra_mile/extra_curricular_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/url/url_luncher.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class ActivityDetails extends StatefulWidget {
  final Extracurricularactivities activity;
  const ActivityDetails({super.key, required this.activity});

  @override
  State<ActivityDetails> createState() => _ActivityDetailsState();
}

class _ActivityDetailsState extends State<ActivityDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0D4065),
        foregroundColor: Colors.white,
        actions: [
          getLogoutButton(),
        ],
      ),
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
                      SizedBox(
                        height: mq.height * 0.04,
                      ),
                      Image.asset(
                        'assets/png/icons/student/socities.png',
                        height: mq.height * 0.1,
                      ),
                      const Text("Joining Socities",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                SizedBox(
                  height: mq.height * 0.55,
                  width: mq.width * 0.9,
                  child: Container(
                    height: mq.height * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.black,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: mq.height * 0.35,
                          width: mq.width * 0.85,
                          child: Image.network(
                            "https://mujtaba-io-university-portal.hf.space${widget.activity.image!}",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "${widget.activity.title}",
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Join Now:",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              UrlLuncher.launchURL(widget.activity.link!);
                            },
                            child: Text(
                              widget.activity.link!,
                              style: const TextStyle(
                                  color: Colors.blue, fontSize: 14),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
