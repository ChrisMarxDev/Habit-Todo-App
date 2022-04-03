// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'complete_daily_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompleteDailyInput _$CompleteDailyInputFromJson(Map<String, dynamic> json) {
  return _CompleteDailyInput.fromJson(json);
}

/// @nodoc
class _$CompleteDailyInputTearOff {
  const _$CompleteDailyInputTearOff();

  _CompleteDailyInput call(
      {required Map<String, DailyInputElement> entries,
      @DateTimeTimestampConverter() required DateTime date}) {
    return _CompleteDailyInput(
      entries: entries,
      date: date,
    );
  }

  CompleteDailyInput fromJson(Map<String, Object?> json) {
    return CompleteDailyInput.fromJson(json);
  }
}

/// @nodoc
const $CompleteDailyInput = _$CompleteDailyInputTearOff();

/// @nodoc
mixin _$CompleteDailyInput {
  Map<String, DailyInputElement> get entries =>
      throw _privateConstructorUsedError;
  @DateTimeTimestampConverter()
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompleteDailyInputCopyWith<CompleteDailyInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteDailyInputCopyWith<$Res> {
  factory $CompleteDailyInputCopyWith(
          CompleteDailyInput value, $Res Function(CompleteDailyInput) then) =
      _$CompleteDailyInputCopyWithImpl<$Res>;
  $Res call(
      {Map<String, DailyInputElement> entries,
      @DateTimeTimestampConverter() DateTime date});
}

/// @nodoc
class _$CompleteDailyInputCopyWithImpl<$Res>
    implements $CompleteDailyInputCopyWith<$Res> {
  _$CompleteDailyInputCopyWithImpl(this._value, this._then);

  final CompleteDailyInput _value;
  // ignore: unused_field
  final $Res Function(CompleteDailyInput) _then;

  @override
  $Res call({
    Object? entries = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as Map<String, DailyInputElement>,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$CompleteDailyInputCopyWith<$Res>
    implements $CompleteDailyInputCopyWith<$Res> {
  factory _$CompleteDailyInputCopyWith(
          _CompleteDailyInput value, $Res Function(_CompleteDailyInput) then) =
      __$CompleteDailyInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {Map<String, DailyInputElement> entries,
      @DateTimeTimestampConverter() DateTime date});
}

/// @nodoc
class __$CompleteDailyInputCopyWithImpl<$Res>
    extends _$CompleteDailyInputCopyWithImpl<$Res>
    implements _$CompleteDailyInputCopyWith<$Res> {
  __$CompleteDailyInputCopyWithImpl(
      _CompleteDailyInput _value, $Res Function(_CompleteDailyInput) _then)
      : super(_value, (v) => _then(v as _CompleteDailyInput));

  @override
  _CompleteDailyInput get _value => super._value as _CompleteDailyInput;

  @override
  $Res call({
    Object? entries = freezed,
    Object? date = freezed,
  }) {
    return _then(_CompleteDailyInput(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as Map<String, DailyInputElement>,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompleteDailyInput implements _CompleteDailyInput {
  _$_CompleteDailyInput(
      {required this.entries,
      @DateTimeTimestampConverter() required this.date});

  factory _$_CompleteDailyInput.fromJson(Map<String, dynamic> json) =>
      _$$_CompleteDailyInputFromJson(json);

  @override
  final Map<String, DailyInputElement> entries;
  @override
  @DateTimeTimestampConverter()
  final DateTime date;

  @override
  String toString() {
    return 'CompleteDailyInput(entries: $entries, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompleteDailyInput &&
            const DeepCollectionEquality().equals(other.entries, entries) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entries),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$CompleteDailyInputCopyWith<_CompleteDailyInput> get copyWith =>
      __$CompleteDailyInputCopyWithImpl<_CompleteDailyInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompleteDailyInputToJson(this);
  }
}

abstract class _CompleteDailyInput implements CompleteDailyInput {
  factory _CompleteDailyInput(
          {required Map<String, DailyInputElement> entries,
          @DateTimeTimestampConverter() required DateTime date}) =
      _$_CompleteDailyInput;

  factory _CompleteDailyInput.fromJson(Map<String, dynamic> json) =
      _$_CompleteDailyInput.fromJson;

  @override
  Map<String, DailyInputElement> get entries;
  @override
  @DateTimeTimestampConverter()
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$CompleteDailyInputCopyWith<_CompleteDailyInput> get copyWith =>
      throw _privateConstructorUsedError;
}
