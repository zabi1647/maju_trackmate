import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestMakeUpLecture {
  Future<bool> addLecture(
    String className,
    String courseCode,
    String day,
    String blockName,
    String roomName,
    String startTime,
    String endTime,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request = http.MultipartRequest('POST', Uri.parse(addExtraClassApi));
      request.fields.addAll({
        "class_name": className,
        "course_code": courseCode,
        "day": day,
        "block_name": blockName,
        "room_name": roomName,
        "start_time": startTime,
        "end_time": endTime,
      });
      log(request.fields.toString());

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 400) {
        MyDialogs.error(msg: "Please enter every filed correct");
        return false;
      } else {
        // If the server returns an error response, handle it
        MyDialogs.error(msg: "Internal server error");
        return false;
      }
    } catch (e) {
      MyDialogs.error(msg: "Internet is not working...");
      return false;
    }
  }
}
