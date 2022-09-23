// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'card_to_do.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardToDo _$CardToDoFromJson(Map<String, dynamic> json) {
  return _CardToDo.fromJson(json);
}

/// @nodoc
mixin _$CardToDo {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardToDoCopyWith<CardToDo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardToDoCopyWith<$Res> {
  factory $CardToDoCopyWith(CardToDo value, $Res Function(CardToDo) then) =
      _$CardToDoCopyWithImpl<$Res>;
  $Res call({String title, String description, bool done});
}

/// @nodoc
class _$CardToDoCopyWithImpl<$Res> implements $CardToDoCopyWith<$Res> {
  _$CardToDoCopyWithImpl(this._value, this._then);

  final CardToDo _value;
  // ignore: unused_field
  final $Res Function(CardToDo) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CardToDoCopyWith<$Res> implements $CardToDoCopyWith<$Res> {
  factory _$$_CardToDoCopyWith(
          _$_CardToDo value, $Res Function(_$_CardToDo) then) =
      __$$_CardToDoCopyWithImpl<$Res>;
  @override
  $Res call({String title, String description, bool done});
}

/// @nodoc
class __$$_CardToDoCopyWithImpl<$Res> extends _$CardToDoCopyWithImpl<$Res>
    implements _$$_CardToDoCopyWith<$Res> {
  __$$_CardToDoCopyWithImpl(
      _$_CardToDo _value, $Res Function(_$_CardToDo) _then)
      : super(_value, (v) => _then(v as _$_CardToDo));

  @override
  _$_CardToDo get _value => super._value as _$_CardToDo;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? done = freezed,
  }) {
    return _then(_$_CardToDo(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_CardToDo implements _CardToDo {
  _$_CardToDo(
      {required this.title, required this.description, required this.done});

  factory _$_CardToDo.fromJson(Map<String, dynamic> json) =>
      _$$_CardToDoFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final bool done;

  @override
  String toString() {
    return 'CardToDo(title: $title, description: $description, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardToDo &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.done, done));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(done));

  @JsonKey(ignore: true)
  @override
  _$$_CardToDoCopyWith<_$_CardToDo> get copyWith =>
      __$$_CardToDoCopyWithImpl<_$_CardToDo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardToDoToJson(
      this,
    );
  }
}

abstract class _CardToDo implements CardToDo {
  factory _CardToDo(
      {required final String title,
      required final String description,
      required final bool done}) = _$_CardToDo;

  factory _CardToDo.fromJson(Map<String, dynamic> json) = _$_CardToDo.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$$_CardToDoCopyWith<_$_CardToDo> get copyWith =>
      throw _privateConstructorUsedError;
}
