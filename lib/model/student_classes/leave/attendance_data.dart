class AttendanceData {
  List<Attendance>? attendance;

  AttendanceData({this.attendance});

  AttendanceData.fromJson(Map<String, dynamic> json) {
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendance {
  String? username;
  List<AttendanceClass>? attendance;

  Attendance({this.username, this.attendance});

  Attendance.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    if (json['attendance'] != null) {
      attendance = <AttendanceClass>[];
      json['attendance'].forEach((v) {
        attendance!.add(new AttendanceClass.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceClass {
  String? courseName;
  String? courseCode;
  List<Absents>? absents;

  AttendanceClass({this.courseName, this.courseCode, this.absents});

  AttendanceClass.fromJson(Map<String, dynamic> json) {
    courseName = json['course_name'];
    courseCode = json['course_code'];
    if (json['absents'] != null) {
      absents = <Absents>[];
      json['absents'].forEach((v) {
        absents!.add(new Absents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_name'] = this.courseName;
    data['course_code'] = this.courseCode;
    if (this.absents != null) {
      data['absents'] = this.absents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Absents {
  String? absentDate;

  Absents({this.absentDate});

  Absents.fromJson(Map<String, dynamic> json) {
    absentDate = json['absent_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['absent_date'] = this.absentDate;
    return data;
  }
}
