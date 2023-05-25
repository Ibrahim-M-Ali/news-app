import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/source_response.dart';

class ApiServices {
  static Future<AllResponse> getNews(newsCategory) async {
    String url =
        'https://newsapi.org/v2/top-headlines?category=$newsCategory&apiKey=5e2728b4973543f2a3b7a18034ea6365';
    var response = await http.get(Uri.parse(url));
    // var data = res['articles'];

    return AllResponse.fromJson(jsonDecode(response.body));
  }
}
