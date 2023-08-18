import 'package:xflutter/util/app_constant.dart';

loadNewsCategoriesEndpoint(String category) =>
    "http://newsapi.org/v$apiVersion/top-headlines?country=$country&category=$category&apiKey=$apiKey";

String loadNewsEndpoint =
    "http://newsapi.org/v$apiVersion/top-headlines?country=$country&apiKey=$apiKey";

String fetchBykeywords(String keywords) =>
    "https://newsapi.org/v2/everything?q=$keywords&apiKey=ddb676ec8d80401a82ddd0cea2665afc";
