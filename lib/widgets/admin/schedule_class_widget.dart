import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/admin/accept_makeup_lecture.dart';
import 'package:maju_trackmate/apis/admin/reject_makeup_lecture.dart';
import 'package:maju_trackmate/model/admin/extra_classes_data.dart';

Widget scheduleClassWidget(
    MakeupLectures makeupLectures, VoidCallback refreshCallback) {
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
                makeupLectures.teacher!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              makeupLectures.startTime! + ' - ' + makeupLectures.endTime!,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        // Right Section: Icons
        SizedBox(
          width: 50,
          child: Text(
            makeupLectures.course!,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () async {
                // Accept the lecture
                bool isAccepted = await AcceptMakeupLectureApi().acceptLecture(
                  makeupLectures.lectureId.toString(),
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
                bool isAccepted = await RejectMakeupLectureApi().rejectLecture(
                  makeupLectures.lectureId.toString(),
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
