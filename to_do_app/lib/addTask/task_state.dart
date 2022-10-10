import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:to_do_app/domain/card_to_do.dart';

part 'task_state.freezed.dart';

@freezed
class TaskState with _$TaskState {
  factory TaskState(
      {required CardToDo task}) = _TaskState;

}
