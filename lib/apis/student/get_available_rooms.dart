import 'dart:convert';

import 'package:http/http.dart';
import 'package:maju_trackmate/model/student_classes/available/available_classes_data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAvailableRooms {
  Future<RoomAvailableData> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(availableRoomsApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);
      if (response.statusCode == 200) {
        return RoomAvailableData.fromJson(jsonDecode(response.body));
      } else {
        return RoomAvailableData();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
