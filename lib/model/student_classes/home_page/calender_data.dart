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
    data['semester'] = semester;
    if (calendar != null) {
      data['calendar'] = calendar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Calendar {
  int? calendarEventId;
  String? title;
  String? startDate;

  Calendar({this.calendarEventId, this.title, this.startDate});

  Calendar.fromJson(Map<String, dynamic> json) {
    calendarEventId = json['calendar_event_id'];
    title = json['title'];
    startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calendar_event_id'] = calendarEventId;
    data['title'] = title;
    data['start_date'] = startDate;
    return data;
  }
}
