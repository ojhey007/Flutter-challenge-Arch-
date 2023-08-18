import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:xflutter/api/api_constant.dart';
import 'package:xflutter/model/article_model.dart';

class FetchDataRepository {
  Future<List<Articles>> getNewFeeds() async {
    Response response = await get(Uri.parse(loadNewsEndpoint));
    debugPrint("Got Here!! ${response.statusCode}");
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      debugPrint("Got response!! $result");

      return result.map((e) => Articles.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<Articles>> searchByKeyWord(String keywords) async {
    Response response = await get(Uri.parse(fetchBykeywords(keywords)));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      debugPrint("Got rese!! $result");

      return result.map((e) => Articles.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

class FetchDataByCategoryRepository {
  Future<List<Articles>> getNewFeeds(String category) async {
    Response response =
        await get(Uri.parse(loadNewsCategoriesEndpoint(category)));
    debugPrint("Got Here!! ${response.statusCode}");
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      debugPrint("Got response!! $result");

      return result.map((e) => Articles.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
