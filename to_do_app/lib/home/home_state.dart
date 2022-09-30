import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do_app/domain/card_to_do.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState(
      {required List<CardToDo> tasks}) = _HomeState;

}
