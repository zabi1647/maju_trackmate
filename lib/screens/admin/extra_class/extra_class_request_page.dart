import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/admin/get_extra_classes_data.dart';
import 'package:maju_trackmate/apis/admin/accept_makeup_lecture.dart';
import 'package:maju_trackmate/model/admin/extra_classes_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/admin/schedule_class_widget.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class ExtraClassRequestPage extends StatefulWidget {
  const ExtraClassRequestPage({super.key});

  @override
  State<ExtraClassRequestPage> createState() => _ExtraClassRequestPageState();
}

class _ExtraClassRequestPageState extends State<ExtraClassRequestPage> {
  late Future<ExtraClassesData?> _extraClassesFuture;

  @override
  void initState() {
    super.initState();
    _refreshExtraClasses();
  }

  void _refreshExtraClasses() {
    setState(() {
      _extraClassesFuture = GetExtraClassesData().fetchData();
    });
  }

  Future<void> _confirmAllClasses() async {
    final snapshot = await _extraClassesFuture;
    if (snapshot?.makeupLectures != null) {
      for (var lecture in snapshot!.makeupLectures!) {
        await AcceptMakeupLectureApi()
            .acceptLecture(lecture.lectureId.toString());
      }
      _refreshExtraClasses();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Header Section (unchanged)
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: getLogoutButton(),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Extra Class \nRequest',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.asset(
                              'assets/png/icons/student/extra_request.png',
                              height: mq.height * 0.07,
                            ),
                          ]),
                    ],
                  ),
                ),
                SizedBox(height: mq.height * 0.02),

                Container(
                  width: mq.width * 0.9,
                  height: mq.height * 0.6,
                  padding: EdgeInsets.symmetric(
                    horizontal: mq.width * 0.05,
                    vertical: mq.height * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Text("Request",
                          style: TextStyle(
                            color: Color(0xff0D4065),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(height: mq.height * 0.01),
                      SizedBox(
                        width: mq.width * 0.6,
                        child: const Divider(
                          color: Color(0xff0D4065),
                        ),
                      ),
                      SizedBox(height: mq.height * 0.01),
                      SizedBox(
                        height: mq.height * 0.4,
                        child: FutureBuilder(
                            future: _extraClassesFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return const Center(
                                  child: Text("Error in data"),
                                );
                              } else {
                                if (snapshot.data?.makeupLectures?.isEmpty ??
                                    snapshot.data == null) {
                                  return const Center(
                                    child: Text("No Extra Classes Request"),
                                  );
                                } else {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot
                                              .data!.makeupLectures?.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: scheduleClassWidget(
                                            snapshot
                                                .data!.makeupLectures![index],
                                            _refreshExtraClasses,
                                          ),
                                        );
                                      });
                                }
                              }
                            }),
                      ),
                      SizedBox(
                        height: mq.height * 0.05,
                        width: mq.width * 0.4,
                        child: ElevatedButton(
                          onPressed: _confirmAllClasses,
                          style: ButtonStyle(
                            backgroundColor:
                                const WidgetStatePropertyAll(Color(0xff0D4065)),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Confirm",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
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
