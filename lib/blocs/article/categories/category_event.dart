import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryEvent extends Equatable {
  final String data;

  const CategoryEvent(this.data);
}

class LoadCategoryEvent extends CategoryEvent {
  const LoadCategoryEvent(super.data);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadedCategoryEvent extends CategoryEvent {
  const LoadedCategoryEvent(super.data);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
