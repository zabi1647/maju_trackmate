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
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  int? newsId;
  String? title;
  String? content;
  String? youtubeLink;
  String? image;
  String? createdAt;

  News(
      {this.newsId,
      this.title,
      this.content,
      this.youtubeLink,
      this.image,
      this.createdAt});

  News.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    title = json['title'];
    content = json['content'];
    youtubeLink = json['youtube_link'];
    image = json['image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['youtube_link'] = this.youtubeLink;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    return data;
  }
}
