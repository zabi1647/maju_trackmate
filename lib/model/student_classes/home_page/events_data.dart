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
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Events {
  String? title;
  String? imageUrl;
  String? description;
  String? link;
  String? createdAt;
  String? day;
  String? time;
  String? venue;
  String? registration;
  String? participationRegistration;
  String? linkedin;

  Events(
      {this.title,
      this.imageUrl,
      this.description,
      this.link,
      this.createdAt,
      this.day,
      this.time,
      this.venue,
      this.registration,
      this.participationRegistration,
      this.linkedin});

  Events.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['image_url'];
    description = json['description'];
    link = json['link'];
    createdAt = json['created_at'];
    day = json['day'];
    time = json['time'];
    venue = json['venue'];
    registration = json['registration'];
    participationRegistration = json['participation_registration'];
    linkedin = json['linkedin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    data['day'] = this.day;
    data['time'] = this.time;
    data['venue'] = this.venue;
    data['registration'] = this.registration;
    data['participation_registration'] = this.participationRegistration;
    data['linkedin'] = linkedin;
    return data;
  }
}
