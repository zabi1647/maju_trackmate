class TimeTableData {
  List<Timetable>? timetable;

  TimeTableData({this.timetable});

  TimeTableData.fromJson(Map<String, dynamic> json) {
    if (json['timetable'] != null) {
      timetable = <Timetable>[];
      json['timetable'].forEach((v) {
        timetable!.add(new Timetable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (timetable != null) {
      data['timetable'] = timetable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timetable {
  String? courseName;
  String? courseCode;
  String? teacherName;
  String? day;
  String? room;
  String? startTime;
  String? endTime;

  Timetable(
      {this.courseName,
      this.courseCode,
      this.teacherName,
      this.day,
      this.room,
      this.startTime,
      this.endTime});

  Timetable.fromJson(Map<String, dynamic> json) {
    courseName = json['course_name'];
    courseCode = json['course_code'];
    teacherName = json['teacher_name'];
    day = json['day'];
    room = json['room'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_name'] = courseName;
    data['course_code'] = courseCode;
    data['teacher_name'] = teacherName;
    data['day'] = day;
    data['room'] = room;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    return data;
  }
}
