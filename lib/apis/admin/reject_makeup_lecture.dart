import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RejectMakeupLectureApi {
  Future<bool> rejectLecture(String id) async {
    MyDialogs.showProgress();
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request =
          http.MultipartRequest('POST', Uri.parse(rejectMakeupLectureApi));
      request.fields.addAll({
        "lecture_id": id, // Required, id of the lecture
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.back();
        return true;
      } else if (response.statusCode == 401) {
        Get.back();
        MyDialogs.error(
            msg: "Error while accepting the lecture, please try again");
        return false;
      } else {
        // If the server returns an error response, handle it
        Get.back();
        MyDialogs.error(msg: "Internal server error");
        return false;
      }
    } catch (e) {
      Get.back();
      MyDialogs.error(msg: "Internet is not working...");
      print('An error occurred: $e');
      return false;
    }
  }
}
