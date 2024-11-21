import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookPcApi {
  Future<bool> bookPc(String pc, String timeSlot) async {
    MyDialogs.showProgress();
    String url = bookPcApi;
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    try {
      // Use MultipartRequest for form-data
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['pc_name'] = pc;
      request.fields['time_slot'] = timeSlot;

      // Add headers if needed
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'token': token!,
      });

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      // final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        Get.back();
        return true;
      } else if (response.statusCode == 401) {
        Get.back();
        MyDialogs.error(msg: "PC is already reserved at the given time");
        return false;
      } else {
        Get.back();
        MyDialogs.error(msg: "An error occurred: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      Get.back();
      MyDialogs.error(msg: "Internet is not working...");
      return false;
    }
  }
}
