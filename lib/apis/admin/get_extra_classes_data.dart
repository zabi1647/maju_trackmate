import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:maju_trackmate/model/admin/extra_classes_data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetExtraClassesData {
  Future<ExtraClassesData> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(getExtraClassesDataApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);
      log(response.body);
      if (response.statusCode == 200) {
        return ExtraClassesData.fromJson(jsonDecode(response.body));
      } else {
        return ExtraClassesData();
      }
    } catch (e, stacktrace) {
      print(stacktrace);
      throw Exception();
    }
  }
}
