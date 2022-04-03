// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'complete_routine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CompleteRoutine _$CompleteRoutineFromJson(Map<String, dynamic> json) {
  return _CompleteRoutine.fromJson(json);
}

/// @nodoc
class _$CompleteRoutineTearOff {
  const _$CompleteRoutineTearOff();

  _CompleteRoutine call({required List<RoutineElementDescription> entries}) {
    return _CompleteRoutine(
      entries: entries,
    );
  }

  CompleteRoutine fromJson(Map<String, Object?> json) {
    return CompleteRoutine.fromJson(json);
  }
}

/// @nodoc
const $CompleteRoutine = _$CompleteRoutineTearOff();

/// @nodoc
mixin _$CompleteRoutine {
  List<RoutineElementDescription> get entries =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CompleteRoutineCopyWith<CompleteRoutine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteRoutineCopyWith<$Res> {
  factory $CompleteRoutineCopyWith(
          CompleteRoutine value, $Res Function(CompleteRoutine) then) =
      _$CompleteRoutineCopyWithImpl<$Res>;
  $Res call({List<RoutineElementDescription> entries});
}

/// @nodoc
class _$CompleteRoutineCopyWithImpl<$Res>
    implements $CompleteRoutineCopyWith<$Res> {
  _$CompleteRoutineCopyWithImpl(this._value, this._then);

  final CompleteRoutine _value;
  // ignore: unused_field
  final $Res Function(CompleteRoutine) _then;

  @override
  $Res call({
    Object? entries = freezed,
  }) {
    return _then(_value.copyWith(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<RoutineElementDescription>,
    ));
  }
}

/// @nodoc
abstract class _$CompleteRoutineCopyWith<$Res>
    implements $CompleteRoutineCopyWith<$Res> {
  factory _$CompleteRoutineCopyWith(
          _CompleteRoutine value, $Res Function(_CompleteRoutine) then) =
      __$CompleteRoutineCopyWithImpl<$Res>;
  @override
  $Res call({List<RoutineElementDescription> entries});
}

/// @nodoc
class __$CompleteRoutineCopyWithImpl<$Res>
    extends _$CompleteRoutineCopyWithImpl<$Res>
    implements _$CompleteRoutineCopyWith<$Res> {
  __$CompleteRoutineCopyWithImpl(
      _CompleteRoutine _value, $Res Function(_CompleteRoutine) _then)
      : super(_value, (v) => _then(v as _CompleteRoutine));

  @override
  _CompleteRoutine get _value => super._value as _CompleteRoutine;

  @override
  $Res call({
    Object? entries = freezed,
  }) {
    return _then(_CompleteRoutine(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<RoutineElementDescription>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CompleteRoutine implements _CompleteRoutine {
  _$_CompleteRoutine({required this.entries});

  factory _$_CompleteRoutine.fromJson(Map<String, dynamic> json) =>
      _$$_CompleteRoutineFromJson(json);

  @override
  final List<RoutineElementDescription> entries;

  @override
  String toString() {
    return 'CompleteRoutine(entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CompleteRoutine &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entries));

  @JsonKey(ignore: true)
  @override
  _$CompleteRoutineCopyWith<_CompleteRoutine> get copyWith =>
      __$CompleteRoutineCopyWithImpl<_CompleteRoutine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CompleteRoutineToJson(this);
  }
}

abstract class _CompleteRoutine implements CompleteRoutine {
  factory _CompleteRoutine({required List<RoutineElementDescription> entries}) =
      _$_CompleteRoutine;

  factory _CompleteRoutine.fromJson(Map<String, dynamic> json) =
      _$_CompleteRoutine.fromJson;

  @override
  List<RoutineElementDescription> get entries;
  @override
  @JsonKey(ignore: true)
  _$CompleteRoutineCopyWith<_CompleteRoutine> get copyWith =>
      throw _privateConstructorUsedError;
}
