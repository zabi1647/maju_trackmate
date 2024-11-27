import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:maju_trackmate/model/admin/pc_reservation_data.dart';
import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPcsReservationData {
  Future<ReservationPcs> fetchData() async {
    final prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('token');

    final url = Uri.parse(getPcsReservationDataApi);
    final headers = {
      'token': token!,
    };

    try {
      final response = await get(url, headers: headers);
      log(response.body);
      if (response.statusCode == 200) {
        return ReservationPcs.fromJson(jsonDecode(response.body));
      } else {
        return ReservationPcs();
      }
    } catch (e, stacktrace) {
      print(stacktrace);
      throw Exception();
    }
  }
}
