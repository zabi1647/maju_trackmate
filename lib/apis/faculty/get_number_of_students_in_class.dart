import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:maju_trackmate/model/faculty/number_of_students_in_class.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetNumberOfStudentsInClassData {
  Future<NumberOfStudentsInClass> fetchData(String id) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request = http.MultipartRequest(
          'POST', Uri.parse(getStudentAttendanceNamesApi));
      request.fields.addAll({'lecture_id': id});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return NumberOfStudentsInClass.fromJson(
            jsonDecode(await response.stream.bytesToString()));
      } else {
        // If the server returns an error response, handle it
        MyDialogs.error(msg: "Internal server error");
        return NumberOfStudentsInClass();
      }
    } catch (e) {
      MyDialogs.error(msg: "Internet is not working...");

      throw Exception();
    }
  }
}
