import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/admin/add_new_news.dart';
import 'package:maju_trackmate/apis/student/get_news_data.dart';
import 'package:maju_trackmate/screens/admin/home_page.dart/home_page_screen.dart/add_new_news_screen.dart';
import 'package:maju_trackmate/screens/admin/home_page.dart/home_page_screen.dart/edit_news_screen.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/url/url_luncher.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class NewsScreenAdmin extends StatefulWidget {
  const NewsScreenAdmin({super.key});

  @override
  State<NewsScreenAdmin> createState() => _NewsScreenAdminState();
}

class _NewsScreenAdminState extends State<NewsScreenAdmin> {
  Future<void> _handleDelete(String newsId) async {
    try {
      bool success = await AddNewNewsApi().deleteNewsDate(newsId);
      if (success) {
        // First close the dialog
        Navigator.of(context).pop();

        // Then update the state and show success message
        setState(() {});
      } else {
        Get.snackbar("Error", "Failed to delete news",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } catch (e) {
      Navigator.of(context).pop();
      Get.snackbar("Error", "An error occurred while deleting news",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        height: mq.height * 0.05,
        width: mq.width * 0.5,
        child: ElevatedButton(
          onPressed: () async {
            bool result = await Get.to(() => const AddNewNewsScreen());
            if (result) {
              setState(() {});
            }
          },
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(Color(0xff0D4065)),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
          child: const Text(
            "Add New News",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: mq.height * 0.15,
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
                    const Text("News",
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
              SizedBox(height: mq.height * 0.02),
              SizedBox(
                height: mq.height * 0.78,
                width: mq.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FutureBuilder(
                    future: GetNewsData().fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text("Error"));
                      } else {
                        if (snapshot.data!.news?.isEmpty ??
                            snapshot.data!.news == null) {
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
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.news!.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  height: mq.height * 0.3,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: mq.height * 0.2,
                                              width: mq.width * 0.7,
                                              child: Image.network(
                                                  "https://president250-university-portal.hf.space${snapshot.data!.news![index].image!}"),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.zero,
                                              icon: const Icon(Icons.more_vert),
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (context) =>
                                                            AlertDialog(
                                                              title: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Text(
                                                                    "Select",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Color(
                                                                          0xff0D4065),
                                                                      fontSize:
                                                                          20,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                      onPressed: () =>
                                                                          Navigator.of(context)
                                                                              .pop(),
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .close,
                                                                        color: Colors
                                                                            .red,
                                                                      ))
                                                                ],
                                                              ),
                                                              content: SizedBox(
                                                                width:
                                                                    mq.width *
                                                                        0.2,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    ElevatedButton(
                                                                        onPressed:
                                                                            () async {
                                                                          final result = await Get.to(() =>
                                                                              EditNewsScreen(
                                                                                news: snapshot.data!.news![index],
                                                                              ));
                                                                          if (result ==
                                                                              true) {
                                                                            Navigator.of(context).pop();
                                                                            setState(() {});
                                                                          }
                                                                        },
                                                                        style: ButtonStyle(
                                                                            backgroundColor: const MaterialStatePropertyAll(
                                                                              Color(0xff0D4065),
                                                                            ),
                                                                            shape: MaterialStatePropertyAll(
                                                                              RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                            )),
                                                                        child: const Text(
                                                                          "Edit",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold),
                                                                        )),
                                                                    ElevatedButton(
                                                                        onPressed: () => _handleDelete(snapshot
                                                                            .data!
                                                                            .news![index]
                                                                            .newsId
                                                                            .toString()),
                                                                        style: ButtonStyle(
                                                                            backgroundColor: const MaterialStatePropertyAll(
                                                                              Color(0xff0D4065),
                                                                            ),
                                                                            shape: MaterialStatePropertyAll(
                                                                              RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                            )),
                                                                        child: const Text(
                                                                          "Delete",
                                                                          style: TextStyle(
                                                                              color: Colors.redAccent,
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 30.0),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Text(
                                            snapshot.data!.news![index].title!,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            UrlLuncher.launchURL(snapshot.data!
                                                .news![index].youtubeLink!);
                                          },
                                          child: Text(
                                            snapshot.data!.news![index]
                                                .youtubeLink!,
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12),
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
              ),
              SizedBox(height: mq.height * 0.05),
            ],
          ),
        ),
      )),
    );
  }
}
