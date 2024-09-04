// import 'dart:convert';
// import 'dart:core';
// import 'dart:core';
//
// import 'package:http/http.dart' as http;
// import 'package:test123/model/ReNewReal.dart';
// import 'package:test123/home_screen/model/PopularMoviesModel.dart';
//
// class ApiManger {
//   static const Map<String, String> headers = {
//     "Authorization":
//         "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZTU2Yzg2MzZiOTExOTBhMDdkNmExOWM5OWYyMDgzYyIsInN1YiI6IjY1NDE1Yzg3YjY4NmI5MDBlMTE4MDg1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.45qrNJVRNiUMtYid_qmIp5kKJ_Q0Obk-yRRywYsGgP8",
//     "accept": "application/json"
//   };
//   static const String host = "api.themoviedb.org";
//
//   static Future<PopularMoviesModel?> getPopular() async {
//     Uri url = Uri.https(
//       host,
//       "/3/movie/popular",
//     );
//     var response = await http.get(url, headers: headers);
//     try {
//       // Map<String, dynamic> format = jsonDecode(response.body);
//       PopularMoviesModel rePopular = PopularMoviesModel.fromJson(jsonDecode(response.body));
//       return rePopular;
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   static Future<ReNewReal?> getRecent() async {
//     var url = Uri.https(host, "/3/movie/upcoming", {
//       "language": "en-US",
//     });
//
//     var response = await http.get(url, headers: headers);
//     try {
//       ReNewReal reNewReal = ReNewReal.fromJson(jsonDecode(response.body));
//       return reNewReal;
//     } catch (e) {}
//     return null;
//   }
// }
