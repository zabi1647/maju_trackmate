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
  String? title;
  String? image;
  String? description;
  String? link;
  String? createdAt;

  Events({this.title, this.image, this.description, this.link, this.createdAt});

  Events.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];
    link = json['link'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['link'] = link;
    data['created_at'] = createdAt;
    return data;
  }
}
