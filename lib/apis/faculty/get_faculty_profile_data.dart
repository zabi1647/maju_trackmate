import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:maju_trackmate/model/faculty/faculty_profile_data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetFacultyProfileData {
  Future<FacultyProfileData> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(getStudentProfileApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);

      if (response.statusCode == 200) {
        log(response.body);
        return FacultyProfileData.fromJson(jsonDecode(response.body));
      } else {
        return FacultyProfileData();
      }
    } catch (e, staktrace) {
      print(staktrace);
      throw Exception();
    }
  }
}
