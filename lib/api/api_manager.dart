import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_app/api/api_constatnts.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/NewsResponse.dart' as news;
import 'package:news_app/model/SourceResponse.dart' as source;

import 'end_points.dart';

class ApiManager { // No usages
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=500e
  */
  static Future<source.SourceResponse> getSources() async { // ✅ استخدم prefix هنا
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.SourceApi,
      {
        'apiKey': ApiConstants.apiKey,
      },
    );
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return source.SourceResponse.fromJson(json); // ✅ هنا كمان
    } catch (e) {
      throw e;
    }
  }

  static Future<news.NewsResponse> getNewsBySourceId(String sourceId) async { // ✅ وهنا
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.NewApi,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
      },
    );
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return news.NewsResponse.fromJson(json); // ✅ وهنا كمان
    } catch (e) {
      rethrow;
    }
  }
}