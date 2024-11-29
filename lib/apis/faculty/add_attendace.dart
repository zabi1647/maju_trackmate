import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddStudentAttendanceApi {
  Future<bool> addAttendence(String lectureId, List<String> studentData) async {
    final prefs = await SharedPreferences.getInstance();
    MyDialogs.showProgress();
    log(studentData.toString());
    log(lectureId);

    String? token = prefs.getString('token');

    try {
      var headers = {
        'token': token!,
      };

      // Prepare form data
      var request =
          http.MultipartRequest('POST', Uri.parse(postMarkAttendenceApi));
      request.fields['lecture_id'] = lectureId;

      // Add each student as 'students[]'
      for (String student in studentData) {
        request.fields.addAll({'students[]': student});
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());

      if (response.statusCode == 201) {
        Get.back();
        return true;
      } else if (response.statusCode == 400) {
        Get.back();
        MyDialogs.error(msg: "Lecture ID and students list are required");
        return false;
      } else {
        Get.back();
        MyDialogs.error(msg: "Internal server error");
        return false;
      }
    } catch (e) {
      Get.back();
      MyDialogs.error(msg: "Internet is not working...");
      log('An error occurred: $e');
      return false;
    }
  }
}
