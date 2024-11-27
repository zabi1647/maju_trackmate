import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/admin/accept_pc_reservation.dart';
import 'package:maju_trackmate/apis/admin/get_pc_reservation_data.dart';
import 'package:maju_trackmate/model/admin/pc_reservation_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:maju_trackmate/widgets/admin/pc_reservation_widget.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class AdminPcReservation extends StatefulWidget {
  final String? labe;
  const AdminPcReservation({super.key, required this.labe});

  @override
  State<AdminPcReservation> createState() => _AdminPcReservationState();
}

class _AdminPcReservationState extends State<AdminPcReservation> {
  late Future<ReservationPcs?> _pcsReservation;

  @override
  void initState() {
    super.initState();
    _refreshPcsReservation();
  }

  void _refreshPcsReservation() {
    setState(() {
      _pcsReservation = GetPcsReservationData().fetchData();
    });
  }

  Future<void> _confirmAllPcs() async {
    try {
      // Wait for the reservation data to be fetched
      final snapshot = await _pcsReservation;

      if (snapshot?.rooms == null) {
        MyDialogs.error(msg: "No reservations to confirm");
        return;
      }

      // Filter rooms by the current label
      final filteredRooms = snapshot!.rooms!
          .where((room) => room.roomName == widget.labe)
          .toList();

      if (filteredRooms.isEmpty) {
        MyDialogs.error(msg: "No reservations in this room");
        return;
      }

      // Track the success of confirmations
      bool allConfirmed = true;
      int confirmedCount = 0;
      int totalPendingReservations = 0;

      // Iterate through PCs in the filtered rooms
      for (var room in filteredRooms) {
        if (room.pcs == null) continue;

        for (var pc in room.pcs!) {
          // Filter pending reservations for this PC
          final pendingReservations = pc.reservations
                  ?.where((reservation) => reservation.isApproved == false)
                  .toList() ??
              [];

          totalPendingReservations += pendingReservations.length;

          // Confirm each pending reservation
          for (var reservation in pendingReservations) {
            final acceptApi = AcceptPcReservationApi();
            bool result = await acceptApi.acceptPcsReservatins(
                pc.pcName.toString(),
                reservation.user ?? '',
                reservation.slot ?? '');

            if (result) {
              confirmedCount++;
            } else {
              allConfirmed = false;
            }
          }
        }
      }

      // Refresh the reservation data after confirmations
      _refreshPcsReservation();

      // Show appropriate dialog based on confirmation results
      if (allConfirmed) {
        MyDialogs.success(
            msg: "Successfully confirmed $confirmedCount reservations");
      } else {
        MyDialogs.error(
            msg:
                "Confirmed $confirmedCount out of $totalPendingReservations reservations");
      }
    } catch (e) {
      MyDialogs.error(msg: "Error confirming reservations: ${e.toString()}");
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
                            'PC Reservation \nRequests',
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
                        ],
                      ),
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
                      Text(
                        "Pending Reservations for ${widget.labe}",
                        style: const TextStyle(
                          color: Color(0xff0D4065),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: mq.height * 0.01),
                      SizedBox(
                        width: mq.width * 0.6,
                        child: const Divider(
                          color: Color(0xff0D4065),
                        ),
                      ),
                      SizedBox(height: mq.height * 0.01),
                      Expanded(
                        child: FutureBuilder<ReservationPcs?>(
                          future: _pcsReservation,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (snapshot.hasError) {
                              return Center(
                                child: Text("Error: ${snapshot.error}"),
                              );
                            }

                            if (snapshot.data == null ||
                                snapshot.data!.rooms == null) {
                              return const Center(
                                child: Text("No PC Reservation Requests"),
                              );
                            }

                            // Filter rooms based on the selected room label
                            final filteredRooms = snapshot.data!.rooms!
                                .where((room) => room.roomName == widget.labe)
                                .toList();

                            if (filteredRooms.isEmpty) {
                              return const Center(
                                child: Text("No Reservations for this Room"),
                              );
                            }

                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: filteredRooms[0].pcs?.length ?? 0,
                              itemBuilder: (context, pcIndex) {
                                final pc = filteredRooms[0].pcs![pcIndex];

                                // Filter reservations that are not approved
                                final pendingReservations = pc.reservations
                                        ?.where((reservation) =>
                                            reservation.isApproved == false)
                                        .toList() ??
                                    [];

                                if (pendingReservations.isEmpty) {
                                  return const SizedBox.shrink();
                                }

                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: pendingReservations.length,
                                  itemBuilder: (context, reservationIndex) {
                                    final reservation =
                                        pendingReservations[reservationIndex];
                                    return pcReservationWidget(
                                      reservation,
                                      _refreshPcsReservation,
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: mq.height * 0.02),
                      SizedBox(
                        height: mq.height * 0.05,
                        width: mq.width * 0.4,
                        child: ElevatedButton(
                          onPressed: _confirmAllPcs,
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
                            "Confirm All",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
