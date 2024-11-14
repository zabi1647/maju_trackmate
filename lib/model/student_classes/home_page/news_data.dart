class NewsData {
  List<News>? news;

  NewsData({this.news});

  NewsData.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (news != null) {
      data['news'] = news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String? title;
  String? content;
  String? createdAt;

  News({this.title, this.content, this.createdAt});

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['content'] = content;
    data['created_at'] = createdAt;
    return data;
  }
}
