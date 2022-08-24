import 'dart:convert';
import 'dart:io';

import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/data/models/article.dart';
import 'package:startercode_project/utils/constants.dart' as AppConst;

class ArticleRepository {
  final ApiProvider _provider = ApiProvider();
  final String _adsKey = AppConst.API_ADS_KEY;

  Future<ArticleResponse> fetchListArticle() async {
    final response = await _provider.get('/posts', headers: {
      // HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'application/json',
      'ADS-Key': _adsKey
    });

    Map<String, dynamic> data = response;

    return ArticleResponse.fromJson(data);
  }

  Future<void> createArticle(
      {required String title, required String bodyArticle}) async {
    final Map<String, dynamic> body = {
      "title": title,
      "description": bodyArticle,
    };

    await _provider.post('/posts', body: jsonEncode(body), headers: {
      // HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'application/json',
      'ADS-Key': _adsKey
    });
  }
}
