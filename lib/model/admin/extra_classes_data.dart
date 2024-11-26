class ExtraClassesData {
  List<MakeupLectures>? makeupLectures;

  ExtraClassesData({this.makeupLectures});

  ExtraClassesData.fromJson(Map<String, dynamic> json) {
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
  int? lectureId;
  String? student;
  String? course;
  String? teacher;
  String? day;
  String? room;
  String? startTime;
  String? endTime;
  bool? isMakeupApproved;
  String? createdAt;

  MakeupLectures(
      {this.lectureId,
      this.student,
      this.course,
      this.teacher,
      this.day,
      this.room,
      this.startTime,
      this.endTime,
      this.isMakeupApproved,
      this.createdAt});

  MakeupLectures.fromJson(Map<String, dynamic> json) {
    lectureId = json['lecture_id'];
    student = json['student'];
    course = json['course'];
    teacher = json['teacher'];
    day = json['day'];
    room = json['room'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isMakeupApproved = json['is_makeup_approved'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lecture_id'] = this.lectureId;
    data['student'] = this.student;
    data['course'] = this.course;
    data['teacher'] = this.teacher;
    data['day'] = this.day;
    data['room'] = this.room;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_makeup_approved'] = this.isMakeupApproved;
    data['created_at'] = this.createdAt;
    return data;
  }
}
