class EventsData {
  List<Events>? events;

  EventsData({this.events});

  EventsData.fromJson(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (events != null) {
      data['events'] = events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  int? eventId;
  String? title;
  String? image;
  String? description;
  String? link;
  String? createdAt;
  String? date;
  String? time;
  String? venue;
  String? registration;
  String? participationRegistration;
  String? linkedin;

  Events(
      {this.eventId,
      this.title,
      this.image,
      this.description,
      this.link,
      this.createdAt,
      this.date,
      this.time,
      this.venue,
      this.registration,
      this.participationRegistration,
      this.linkedin});

  Events.fromJson(Map<String, dynamic> json) {
    eventId = json['event_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    link = json['link'];
    createdAt = json['created_at'];
    date = json['date'];
    time = json['time'];
    venue = json['venue'];
    registration = json['registration'];
    participationRegistration = json['participation_registration'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['event_id'] = eventId;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['link'] = link;
    data['created_at'] = createdAt;
    data['date'] = date;
    data['time'] = time;
    data['venue'] = venue;
    data['registration'] = registration;
    data['participation_registration'] = participationRegistration;
    data['linkedin'] = linkedin;
    return data;
  }
}
