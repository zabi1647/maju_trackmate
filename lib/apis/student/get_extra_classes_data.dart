import 'dart:convert';
import 'package:http/http.dart';
import 'package:maju_trackmate/model/student_classes/extra_mile/extra_classes_Data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetExtraClassData {
  Future<MakeUpClassesData> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(extraClassesApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);
      if (response.statusCode == 200) {
        return MakeUpClassesData.fromJson(jsonDecode(response.body));
      } else {
        return MakeUpClassesData();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
