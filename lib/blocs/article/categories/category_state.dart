import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:xflutter/model/article_model.dart';
import 'package:xflutter/model/category_model.dart';

@immutable
abstract class CategoryState extends Equatable {}

class CategoryLoadingState extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryLoadedState extends CategoryState {
  final List<Articles> categories;
  CategoryLoadedState(this.categories);

  @override
  // TODO: implement props
  List<Object?> get props => [categories];
}

class ErrorState extends CategoryState {
  final String error;
  ErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
