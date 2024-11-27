import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/admin/accept_pc_reservation.dart';
import 'package:maju_trackmate/apis/admin/reject_pcs_reveravtion.dart';
import 'package:maju_trackmate/model/admin/pc_reservation_data.dart';

Widget pcReservationWidget(Reservations pcs, VoidCallback refreshCallback) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left Section: Teacher and Subject
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                pcs.user!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              pcs.slot!,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        // Right Section: Icons
        SizedBox(
          width: 50,
          child: Text(
            "Pc${pcs.pcName.toString()}",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                bool isAccepted =
                    await AcceptPcReservationApi().acceptPcsReservatins(
                  pcs.pcName.toString(),
                  pcs.user.toString(),
                  pcs.slot.toString(),
                );

                if (isAccepted) {
                  // Refresh the list of extra classes
                  refreshCallback();
                }
              },
              icon: Icon(Icons.check_circle, color: Colors.green),
            ),
            IconButton(
              onPressed: () async {
                bool isAccepted = await RejectPcsReservationApi().rejectPCs(
                  pcs.pcName.toString(),
                  pcs.user.toString(),
                  pcs.slot.toString(),
                );

                if (isAccepted) {
                  // Refresh the list of extra classes
                  refreshCallback();
                }
              },
              icon: Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        ),
      ],
    ),
  );
}
