import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/student/get_available_rooms.dart';
import 'package:maju_trackmate/controller/student_rooms_controller.dart';
import 'package:maju_trackmate/screens/admin/available/admin_pc_reservation.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AdminAvailablePage extends StatelessWidget {
  AdminAvailablePage({super.key});

  // Initialize the controller
  final AvailableRoomsController controller =
      Get.put(AvailableRoomsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Header Section
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
                  child: SingleChildScrollView(
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
                ),
                SizedBox(height: mq.height * 0.01),

                // FutureBuilder for data
                SizedBox(
                  height: mq.height * 0.8,
                  child: FutureBuilder(
                    future: GetAvailableRooms().fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Error fetching data"),
                        );
                      } else {
                        if (snapshot.data?.blocks?.isEmpty ?? true) {
                          return const Center(
                            child: Text("No activities found"),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data?.blocks?.length ?? 0,
                            itemBuilder: (context, index) {
                              final block = snapshot.data?.blocks?[index];

                              return Column(
                                children: [
                                  SizedBox(
                                    width: mq.width * 0.9,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.toggleBlock(index);
                                      },
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
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

                                  // Use Obx to reactively rebuild when expanded state changes
                                  Obx(() {
                                    if (controller.expandedBlocks[index] ??
                                        false) {
                                      return Container(
                                        width: mq.width * 0.9,
                                        height: mq.height * 0.3,
                                        margin: const EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: mq.height * 0.05,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.black),
                                                borderRadius:
                                                    const BorderRadius.only(
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
                                              height: mq.height * 0.24,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                ),
                                              ),
                                              child: ListView.builder(
                                                itemCount:
                                                    block?.rooms?.length ?? 0,
                                                itemBuilder: (context, i) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 20,
                                                      top: 20,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () {
                                                        // Handle room tap

                                                        Get.to(() =>
                                                            AdminPcReservation(
                                                                labe: block
                                                                    ?.rooms?[i]
                                                                    .roomName));
                                                      },
                                                      child: Text(
                                                        block?.rooms?[i]
                                                                .roomName ??
                                                            'Unknown Room',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return const SizedBox.shrink();
                                    }
                                  }),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
