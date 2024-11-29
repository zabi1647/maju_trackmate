import 'dart:convert';
import 'package:http/http.dart';
import 'package:maju_trackmate/model/faculty/faculty_time_table_data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetFaclutyTimeTableData {
  Future<FacultyTimeTable> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(getFacultyAllLecturesApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);
      if (response.statusCode == 200) {
        return FacultyTimeTable.fromJson(jsonDecode(response.body));
      } else {
        return FacultyTimeTable();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
