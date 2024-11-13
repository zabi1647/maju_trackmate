class ResultCardData {
  StudentInfo? studentInfo;
  List<Semesters>? semesters;
  Summary? summary;

  ResultCardData({this.studentInfo, this.semesters, this.summary});

  ResultCardData.fromJson(Map<String, dynamic> json) {
    studentInfo = json['student_info'] != null
        ? StudentInfo.fromJson(json['student_info'])
        : null;
    if (json['semesters'] != null) {
      semesters = <Semesters>[];
      json['semesters'].forEach((v) {
        semesters!.add(Semesters.fromJson(v));
      });
    }
    summary =
        json['summary'] != null ? Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (studentInfo != null) {
      data['student_info'] = studentInfo!.toJson();
    }
    if (semesters != null) {
      data['semesters'] = semesters!.map((v) => v.toJson()).toList();
    }
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    return data;
  }
}

class StudentInfo {
  String? registrationNumber;
  String? studentName;
  String? fatherName;
  String? program;
  String? dateOfBirth;
  String? date;

  StudentInfo(
      {this.registrationNumber,
      this.studentName,
      this.fatherName,
      this.program,
      this.dateOfBirth,
      this.date});

  StudentInfo.fromJson(Map<String, dynamic> json) {
    registrationNumber = json['registration_number'];
    studentName = json['student_name'];
    fatherName = json['father_name'];
    program = json['program'];
    dateOfBirth = json['date_of_birth'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['registration_number'] = registrationNumber;
    data['student_name'] = studentName;
    data['father_name'] = fatherName;
    data['program'] = program;
    data['date_of_birth'] = dateOfBirth;
    data['date'] = date;
    return data;
  }
}

class Semesters {
  String? semesterNo;
  String? semester;
  String? year;
  List<Courses>? courses;
  double? gpa;

  Semesters(
      {this.semesterNo, this.semester, this.year, this.courses, this.gpa});

  Semesters.fromJson(Map<String, dynamic> json) {
    semesterNo = json['semester_no'];
    semester = json['semester'];
    year = json['year'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
    gpa = json['gpa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['semester_no'] = semesterNo;
    data['semester'] = semester;
    data['year'] = year;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
    }
    data['gpa'] = gpa;
    return data;
  }
}

class Courses {
  String? code;
  String? title;
  int? creditHours;
  String? grade;

  Courses({this.code, this.title, this.creditHours, this.grade});

  Courses.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    creditHours = json['credit_hours'];
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['title'] = title;
    data['credit_hours'] = creditHours;
    data['grade'] = grade;
    return data;
  }
}

class Summary {
  int? creditsEarned;
  double? cgpa;

  Summary({this.creditsEarned, this.cgpa});

  Summary.fromJson(Map<String, dynamic> json) {
    creditsEarned = json['credits_earned'];
    cgpa = json['cgpa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['credits_earned'] = creditsEarned;
    data['cgpa'] = cgpa;
    return data;
  }
}
