import 'dart:convert';
import 'package:http/http.dart';
import 'package:maju_trackmate/model/student_classes/home_page/news_data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetNewsData {
  Future<NewsData> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(studentNewsApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);
      if (response.statusCode == 200) {
        return NewsData.fromJson(jsonDecode(response.body));
      } else {
        return NewsData();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
