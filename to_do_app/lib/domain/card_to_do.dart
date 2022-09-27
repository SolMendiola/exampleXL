import 'dart:core';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_to_do.freezed.dart';

part 'card_to_do.g.dart';

@freezed
class CardToDo with _$CardToDo {
  @JsonSerializable()
  factory CardToDo(
      {required String title,
      required String description,
      required bool done}) = _CardToDo;

  factory CardToDo.fromJson(Map<String, dynamic> json) =>
      _$CardToDoFromJson(json);
}
