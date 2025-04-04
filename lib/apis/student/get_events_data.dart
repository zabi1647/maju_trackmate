import 'dart:convert';

import 'package:http/http.dart';
import 'package:maju_trackmate/model/student_classes/home_page/events_data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetEventsData {
  Future<EventsData> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(eventsApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);
      // log(response.body);
      if (response.statusCode == 200) {
        return EventsData.fromJson(jsonDecode(response.body));
      } else {
        return EventsData();
      }
    } catch (e, stacktrace) {
      print(stacktrace);
      throw Exception();
    }
  }
}
