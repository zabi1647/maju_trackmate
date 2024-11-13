// import 'dart:convert';

// import 'package:http/http.dart';
// import 'package:maju_trackmate/utils/apis/apis_string%20.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class GetTimeTableData {
//    Future<> fetchCurrenciesData() async {
//    final prefs = await SharedPreferences.getInstance();
   
//     String? token =  prefs.getString('token');
    
//     final url = Uri.parse(studentTimeTable);
//     final headers = {
//       'token': token!,
//     };

//     try {
//       final response = await get(url, headers: headers);

//       if (response.statusCode == 200) {
//         return .fromJson(jsonDecode(response.body));
//       } else {
//         print('Failed to load data: ${response.statusCode}');
//         return 
//       }
//     } catch (e) {
//       print('Error: $e');
//       throw Exception();
//     }
//   }
// }
