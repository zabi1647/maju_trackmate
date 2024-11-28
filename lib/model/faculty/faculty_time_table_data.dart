class FacultyTimeTable {
  List<Timetable>? timetable;

  FacultyTimeTable({this.timetable});

  FacultyTimeTable.fromJson(Map<String, dynamic> json) {
    if (json['timetable'] != null) {
      timetable = <Timetable>[];
      json['timetable'].forEach((v) {
        timetable!.add(new Timetable.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.timetable != null) {
      data['timetable'] = this.timetable!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timetable {
  int? lectureId;
  String? courseName;
  String? courseCode;
  String? className;
  String? day;
  String? room;
  String? startTime;
  String? endTime;

  Timetable(
      {this.lectureId,
      this.courseName,
      this.courseCode,
      this.className,
      this.day,
      this.room,
      this.startTime,
      this.endTime});

  Timetable.fromJson(Map<String, dynamic> json) {
    lectureId = json['lecture_id'];
    courseName = json['course_name'];
    courseCode = json['course_code'];
    className = json['class_name'];
    day = json['day'];
    room = json['room'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lecture_id'] = this.lectureId;
    data['course_name'] = this.courseName;
    data['course_code'] = this.courseCode;
    data['class_name'] = this.className;
    data['day'] = this.day;
    data['room'] = this.room;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
