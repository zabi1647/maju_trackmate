class CurrentlyEnRolledCourses {
  List<Courses>? courses;

  CurrentlyEnRolledCourses({this.courses});

  CurrentlyEnRolledCourses.fromJson(Map<String, dynamic> json) {
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  String? courseId;
  String? courseTitle;
  String? courseType;
  String? preRequisites;

  Courses(
      {this.courseId, this.courseTitle, this.courseType, this.preRequisites});

  Courses.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseTitle = json['course_title'];
    courseType = json['course_type'];
    preRequisites = json['pre_requisites'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['course_id'] = courseId;
    data['course_title'] = courseTitle;
    data['course_type'] = courseType;
    data['pre_requisites'] = preRequisites;
    return data;
  }
}
