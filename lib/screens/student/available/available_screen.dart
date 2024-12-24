import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/student/get_available_rooms.dart';
import 'package:maju_trackmate/controller/student_rooms_controller.dart';
import 'package:maju_trackmate/screens/student/available/pcs_availibility.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AvailableScreen extends StatelessWidget {
  AvailableScreen({super.key});

  final AvailableRoomsController controller =
      Get.put(AvailableRoomsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section - Keep this fixed at the top
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: getLogoutButton(),
                  ),
                  Image.asset(
                    'assets/png/icons/student/availiablity.png',
                    height: mq.height * 0.07,
                  ),
                  const Text(
                    'Availability',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mq.height * 0.01),

            // Scrollable content - Use Expanded to fill remaining space
            Expanded(
              child: FutureBuilder(
                future: GetAvailableRooms().fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error fetching data"),
                    );
                  } else if (snapshot.data?.blocks?.isEmpty ?? true) {
                    return const Center(
                      child: Text("No activities found"),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.only(bottom: mq.height * 0.02),
                    itemCount: snapshot.data?.blocks?.length ?? 0,
                    itemBuilder: (context, index) {
                      final block = snapshot.data?.blocks?[index];

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: mq.width * 0.9,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.toggleBlock(index);
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          const Color(0xff0D4065)),
                                ),
                                child: Text(
                                  block?.blockName ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Obx(() {
                              if (controller.expandedBlocks[index] ?? false) {
                                return Container(
                                  width: mq.width * 0.9,
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: mq.height * 0.05,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Rooms",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        constraints: BoxConstraints(
                                          maxHeight: mq.height * 0.24,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          itemCount: block?.rooms?.length ?? 0,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                left: 20,
                                                top: 20,
                                              ),
                                              child: InkWell(
                                                onTap: () {
                                                  if (i == 0) {
                                                    Get.to(() =>
                                                        PcsAvailibility(
                                                            pcs: block!
                                                                .rooms![i]
                                                                .pcs));
                                                  }
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      block?.rooms?[i]
                                                              .roomName ??
                                                          'Unknown Room',
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 20.0),
                                                      child: Text(
                                                        i == 0
                                                            ? 'Available'
                                                            : 'Not Available',
                                                        style: TextStyle(
                                                          color: i == 0
                                                              ? Colors.green
                                                              : Colors.red,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            }),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
