import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/everything_res.dart';

class AllnewsServices {
  static Future<Everything> getAllNews(search) async {
    String url =
        'https://newsapi.org/v2/everything?q=$search&apiKey=5e2728b4973543f2a3b7a18034ea6365';
    var response = await http.get(Uri.parse(url));
    // var data = res['articles'];

    return Everything.fromJson(jsonDecode(response.body));
  }
}
