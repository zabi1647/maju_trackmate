class MakeUpClassesData {
  List<MakeupLectures>? makeupLectures;

  MakeUpClassesData({this.makeupLectures});

  MakeUpClassesData.fromJson(Map<String, dynamic> json) {
    if (json['makeup_lectures'] != null) {
      makeupLectures = <MakeupLectures>[];
      json['makeup_lectures'].forEach((v) {
        makeupLectures!.add(new MakeupLectures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.makeupLectures != null) {
      data['makeup_lectures'] =
          this.makeupLectures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MakeupLectures {
  String? courseName;
  String? courseCode;
  String? teacherName;
  String? day;
  String? room;
  String? startTime;
  String? endTime;

  MakeupLectures(
      {this.courseName,
      this.courseCode,
      this.teacherName,
      this.day,
      this.room,
      this.startTime,
      this.endTime});

  MakeupLectures.fromJson(Map<String, dynamic> json) {
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
    data['course_name'] = this.courseName;
    data['course_code'] = this.courseCode;
    data['teacher_name'] = this.teacherName;
    data['day'] = this.day;
    data['room'] = this.room;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    return data;
  }
}
