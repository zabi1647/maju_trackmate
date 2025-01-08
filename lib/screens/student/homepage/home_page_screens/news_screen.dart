import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/student/get_news_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/url/url_luncher.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class NewsScreenStudent extends StatefulWidget {
  const NewsScreenStudent({super.key});

  @override
  State<NewsScreenStudent> createState() => _NewsScreenStudentState();
}

class _NewsScreenStudentState extends State<NewsScreenStudent> {
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
        child: Column(
          children: [
            // Fixed Header Container
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
                  const Text(
                    "News",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    'assets/png/icons/student/events.png',
                    height: mq.height * 0.1,
                  ),
                ],
              ),
            ),
            SizedBox(height: mq.height * 0.02),

            // Scrollable News Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
                child: FutureBuilder(
                  future: GetNewsData().fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text("Error"));
                    } else if (snapshot.data?.news?.isEmpty ?? true) {
                      return const Center(
                        child: Text(
                          "No news available",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: EdgeInsets.only(bottom: mq.height * 0.02),
                      itemCount: snapshot.data!.news!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: mq.height * 0.35,
                          margin: const EdgeInsets.only(bottom: 20),
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
                                height: mq.height * 0.2,
                                width: mq.width * 0.7,
                                child: Image.network(
                                    "https://president250-university-portal.hf.space${snapshot.data!.news![index].image!}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    snapshot.data!.news![index].title!,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  UrlLuncher.launchURL(
                                    snapshot.data!.news![index].youtubeLink!,
                                  );
                                },
                                child: Text(
                                  snapshot.data!.news![index].youtubeLink!,
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
