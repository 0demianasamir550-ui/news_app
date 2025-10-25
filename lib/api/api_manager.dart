import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_app/api/api_constatnts.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/NewsResponse.dart' as news;
import 'package:news_app/model/SourceResponse.dart' as source;

class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=500e
  */

  // جلب المصادر (Sources)
  static Future<source.SourceResponse> getSources({required String? categoryId}) async {
    // إذا الـ API يسمح بالفلترة حسب الفئة
    Map<String, String> queryParams = {
      'apiKey': ApiConstants.apiKey,
    };

    if (categoryId != null && categoryId.isNotEmpty) {
      queryParams['category'] = categoryId;
    }

    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.SourceApi,
      queryParams,
    );

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return source.SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  // جلب الأخبار حسب الفئة أو المصدر
  static Future<news.NewsResponse> getNewsByCategory(String categoryId) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.NewApi,
      {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId, // ✅ تصنيف حسب الفئة
      },
    );

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return news.NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<news.NewsResponse> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      EndPoints.NewApi,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId, // ✅ تصنيف حسب المصدر
      },
    );

    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return news.NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}