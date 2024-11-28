import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:maju_trackmate/screens/admin/admin_landing_page.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInApiAdmin {
  Future<void> adminLogin(String username, String password) async {
    MyDialogs.showProgress();
    String url = adminLoginApi;

    try {
      // Use MultipartRequest for form-data
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.fields['username'] = username;
      request.fields['password'] = password;

      // Add headers if needed
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
      });

      // Send the request
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Save the data if login is successful
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('login', true);
        prefs.setInt('type', 1);

        final token = responseBody['token'];
        prefs.setString("token", token);

        MyDialogs.success(msg: 'Login Successful!');
        Get.off(() => const AdminLandingPage());
      } else if (response.statusCode == 401) {
        Get.back();
        MyDialogs.error(msg: "Invalid username or password");
      } else {
        Get.back();
        MyDialogs.error(msg: "An error occurred: ${response.statusCode}");
      }
    } catch (e) {
      Get.back();
      MyDialogs.error(msg: "Internet is not working...");
    }
  }
}
