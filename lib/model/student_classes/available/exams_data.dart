class ExamData {
  List<ExamTimetable> examTimetables;

  ExamData({required this.examTimetables});

  factory ExamData.fromJson(Map<String, dynamic> json) {
    return ExamData(
      examTimetables: (json['exam_timetables'] as List)
          .map((e) => ExamTimetable.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exam_timetables': examTimetables.map((e) => e.toJson()).toList(),
    };
  }
}

class ExamTimetable {
  List<ExamPaper> examPapers;

  ExamTimetable({required this.examPapers});

  factory ExamTimetable.fromJson(Map<String, dynamic> json) {
    return ExamTimetable(
      examPapers: (json['exam_papers'] as List)
          .map((e) => ExamPaper.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exam_papers': examPapers.map((e) => e.toJson()).toList(),
    };
  }
}

class ExamPaper {
  String className;
  String course;
  String teacher;
  String day;
  String room;
  String startTime;
  String endTime;

  ExamPaper({
    required this.className,
    required this.course,
    required this.teacher,
    required this.day,
    required this.room,
    required this.startTime,
    required this.endTime,
  });

  factory ExamPaper.fromJson(Map<String, dynamic> json) {
    return ExamPaper(
      className: json['class'] as String,
      course: json['course'] as String,
      teacher: json['teacher'] as String,
      day: json['day'] as String,
      room: json['room'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'class': className,
      'course': course,
      'teacher': teacher,
      'day': day,
      'room': room,
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}
