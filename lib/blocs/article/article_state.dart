import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:xflutter/model/article_model.dart';

@immutable
abstract class ArticleState extends Equatable {}

class ArticleLoadingState extends ArticleState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ArticleLoadedState extends ArticleState {
  final List<Articles> articles;
  ArticleLoadedState(this.articles);

  @override
  // TODO: implement props
  List<Object?> get props => [articles];
}

class ErrorState extends ArticleState {
  final String error;
  ErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
