// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_to_do.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardToDo _$$_CardToDoFromJson(Map<String, dynamic> json) => _$_CardToDo(
      title: json['title'] as String,
      description: json['description'] as String,
      done: json['done'] as bool,
    );

Map<String, dynamic> _$$_CardToDoToJson(_$_CardToDo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'done': instance.done,
    };
