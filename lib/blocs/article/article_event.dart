import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class LoadArticleEvent extends ArticleEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedArticleEvent extends ArticleEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchArticleEvent extends ArticleEvent {
  final dynamic keyword;

  const SearchArticleEvent(this.keyword);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
