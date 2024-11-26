import 'package:flutter/material.dart';
import 'package:maju_trackmate/model/admin/extra_classes_data.dart';

Widget scheduleClassWidget(MakeupLectures makeupLectures) {
  return Container(
    padding: EdgeInsets.all(8),
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
            Text(
              makeupLectures.teacher!,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              makeupLectures.startTime! + ' - ' + makeupLectures.endTime!,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        // Right Section: Icons
        Text(
          makeupLectures.course!,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check_circle, color: Colors.green),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cancel, color: Colors.red),
            ),
          ],
        ),
      ],
    ),
  );
}
