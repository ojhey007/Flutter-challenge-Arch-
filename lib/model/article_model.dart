import 'package:flutter/material.dart';

class ArticlesModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  ArticlesModel(
      {required this.status,
      required this.totalResults,
      required this.articles});

  ArticlesModel.fromJson(Map<String, dynamic> json) {
    debugPrint('$json');
    status = json['status'] ?? "";
    totalResults = json['totalResults'] ?? 0;
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }
}

class Articles {
  String? title;
  String? author;
  Source? source;
  String? publishedAt;
  String? url;

  Articles({this.title, this.author, this.source, this.publishedAt, this.url});

  Articles.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    author = json['author'];
    source = (json['source'] != null ? Source.fromJson(json['source']) : null)!;
    publishedAt = json['publishedAt'];
    url = json['url'];
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['Id'] ?? "";
    name = json['Name'] ?? "";
  }
}
