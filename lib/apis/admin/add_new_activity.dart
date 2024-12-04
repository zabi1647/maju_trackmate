import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewActivityApi {
  Future<bool> addActivity(
      String semesterName, String tilte, String startDate) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request = http.MultipartRequest('POST', Uri.parse(addNewActivityApi));
      request.fields.addAll({
        'semester_name': semesterName,
        'title': tilte,
        'start_date': startDate,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 401) {
        MyDialogs.error(
            msg: "Semester name, title and start date are required");
        return false;
      } else {
        // If the server returns an error response, handle it
        MyDialogs.error(msg: "Internal server error");
        return false;
      }
    } catch (e) {
      MyDialogs.error(msg: "Internet is not working...");
      print('An error occurred: $e');
      return false;
    }
  }

  Future<bool> editActivity(
      String semesterName, String tilte, String startDate, String id) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request = http.MultipartRequest('POST', Uri.parse(editActivityApi));
      request.fields.addAll({
        'calendar_event_id': id,
        'semester_name': semesterName,
        'title': tilte,
        'start_date': startDate,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 401) {
        MyDialogs.error(
            msg: "Semester name, title and start date are required");
        return false;
      } else {
        // If the server returns an error response, handle it
        MyDialogs.error(msg: "Internal server error");
        return false;
      }
    } catch (e) {
      MyDialogs.error(msg: "Internet is not working...");
      print('An error occurred: $e');
      return false;
    }
  }

  Future<bool> deleteActivity(String id) async {
    MyDialogs.showProgress();
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request = http.MultipartRequest('POST', Uri.parse(deleteActivityApi));
      request.fields.addAll({
        'calendar_event_id': id,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.back();
        MyDialogs.success(msg: "Activity deleted successfully");
        return true;
      } else if (response.statusCode == 401) {
        Get.back();
        MyDialogs.error(
            msg: "Semester name, title and start date are required");
        return false;
      } else {
        Get.back();
        // If the server returns an error response, handle it
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
