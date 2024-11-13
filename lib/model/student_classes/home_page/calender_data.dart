class CalenderData {
  String? semester;
  List<Calendar>? calendar;

  CalenderData({this.semester, this.calendar});

  CalenderData.fromJson(Map<String, dynamic> json) {
    semester = json['semester'];
    if (json['calendar'] != null) {
      calendar = <Calendar>[];
      json['calendar'].forEach((v) {
        calendar!.add(new Calendar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['semester'] = this.semester;
    if (this.calendar != null) {
      data['calendar'] = this.calendar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Calendar {
  String? title;
  String? startDate;

  Calendar({this.title, this.startDate});

  Calendar.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['start_date'] = this.startDate;
    return data;
  }
}
