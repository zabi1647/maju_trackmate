import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:maju_trackmate/model/admin/admin_profile_data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAdminProfileData {
  Future<AdminProfileData> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(getAdminProfileApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);
      if (response.statusCode == 200) {
        return AdminProfileData.fromJson(jsonDecode(response.body));
      } else {
        return AdminProfileData();
      }
    } catch (e, stacktrace) {
      log(stacktrace.toString());
      throw Exception();
    }
  }
}
