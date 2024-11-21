import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/student/get_events_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/url/url_luncher.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Events",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        )),
                    Image.asset(
                      'assets/png/icons/student/events.png',
                      height: mq.height * 0.1,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.02,
              ),
              SizedBox(
                height: mq.height * 0.78,
                width: mq.width * 0.9,
                child: FutureBuilder(
                  future: GetEventsData().fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error"),
                      );
                    } else {
                      if (snapshot.data!.events?.isEmpty ??
                          snapshot.data!.events == null) {
                        return const Center(
                          child: Text(
                            "No events available",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.events!.length,
                            itemBuilder: (context, index) {
                              return Container(
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
                                        "https://mujtaba-io-university-portal.hf.space${snapshot.data!.events![index].image!}",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 30.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Watch Now:",
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
                                          UrlLuncher.launchURL(snapshot
                                              .data!.events![index].link!);
                                        },
                                        child: Text(
                                          snapshot.data!.events![index].link!,
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 14),
                                        )),
                                  ],
                                ),
                              );
                            });
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
