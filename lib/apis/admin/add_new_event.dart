import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewEventApi {
  Future<bool> addEvent(
    String title,
    String description,
    File imageUrl,
    String link,
    String day,
    String time,
    String venu,
    String registration,
    String participationRegistration,
    String linkedin,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request = http.MultipartRequest('POST', Uri.parse(addNewEventApi));
      request.fields.addAll({
        "title": title,
        "description": description,
        "link": link,
        "date": day,
        "time": time,
        "venue": venu,
        "registration": registration,
        "participation_registration": participationRegistration,
        "linkedin": linkedin,
      });
      request.files
          .add(await http.MultipartFile.fromPath('image', imageUrl.path));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 400) {
        MyDialogs.error(msg: "Data is required are required");
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

  Future<bool> editEvent(
    String id,
    String title,
    String description,
    File imageUrl,
    String link,
    String day,
    String time,
    String venu,
    String registration,
    String participationRegistration,
    String linkedin,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request = http.MultipartRequest('POST', Uri.parse(editEventApi));
      request.fields.addAll({
        'event_id': id,
        "title": title,
        "description": description,
        "link": link,
        "date": day,
        "time": time,
        "venue": venu,
        "registration": registration,
        "participation_registration": participationRegistration,
        "linkedin": linkedin,
      });
      request.files
          .add(await http.MultipartFile.fromPath('image', imageUrl.path));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        return true;
      } else if (response.statusCode == 400) {
        MyDialogs.error(msg: "Data is required are required");
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

  Future<bool> deleteEvent(String id) async {
    MyDialogs.showProgress();
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      var headers = {'token': token!};
      var request = http.MultipartRequest('POST', Uri.parse(deleteEventApi));
      request.fields.addAll({
        'event_id': id,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.back();
        MyDialogs.success(msg: "Event deleted successfully");
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
