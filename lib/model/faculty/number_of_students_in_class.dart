class NumberOfStudentsInClass {
  List<Students>? students;

  NumberOfStudentsInClass({this.students});

  NumberOfStudentsInClass.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? studentId;
  String? studentName;
  String? studentUsername;

  Students({this.studentId, this.studentName, this.studentUsername});

  Students.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studentName = json['student_name'];
    studentUsername = json['student_username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = studentId;
    data['student_name'] = studentName;
    data['student_username'] = studentUsername;
    return data;
  }
}
