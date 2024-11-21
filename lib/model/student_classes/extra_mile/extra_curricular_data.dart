class ExtraCurricularData {
  List<Extracurricularactivities>? extracurricularactivities;

  ExtraCurricularData({this.extracurricularactivities});

  ExtraCurricularData.fromJson(Map<String, dynamic> json) {
    if (json['extracurricularactivities'] != null) {
      extracurricularactivities = <Extracurricularactivities>[];
      json['extracurricularactivities'].forEach((v) {
        extracurricularactivities!
            .add(new Extracurricularactivities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.extracurricularactivities != null) {
      data['extracurricularactivities'] =
          this.extracurricularactivities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extracurricularactivities {
  String? title;
  String? image;
  String? description;
  String? link;
  String? createdAt;

  Extracurricularactivities(
      {this.title, this.image, this.description, this.link, this.createdAt});

  Extracurricularactivities.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    description = json['description'];
    link = json['link'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['link'] = this.link;
    data['created_at'] = this.createdAt;
    return data;
  }
}
