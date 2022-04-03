// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'streak_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StreakEntry _$StreakEntryFromJson(Map<String, dynamic> json) {
  return _StreakEntry.fromJson(json);
}

/// @nodoc
class _$StreakEntryTearOff {
  const _$StreakEntryTearOff();

  _StreakEntry call(
      {required String entryId,
      required int streak,
      @DateTimeNullTimestampConverter() required DateTime? lastUpdate}) {
    return _StreakEntry(
      entryId: entryId,
      streak: streak,
      lastUpdate: lastUpdate,
    );
  }

  StreakEntry fromJson(Map<String, Object?> json) {
    return StreakEntry.fromJson(json);
  }
}

/// @nodoc
const $StreakEntry = _$StreakEntryTearOff();

/// @nodoc
mixin _$StreakEntry {
  String get entryId => throw _privateConstructorUsedError;
  int get streak => throw _privateConstructorUsedError;
  @DateTimeNullTimestampConverter()
  DateTime? get lastUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StreakEntryCopyWith<StreakEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StreakEntryCopyWith<$Res> {
  factory $StreakEntryCopyWith(
          StreakEntry value, $Res Function(StreakEntry) then) =
      _$StreakEntryCopyWithImpl<$Res>;
  $Res call(
      {String entryId,
      int streak,
      @DateTimeNullTimestampConverter() DateTime? lastUpdate});
}

/// @nodoc
class _$StreakEntryCopyWithImpl<$Res> implements $StreakEntryCopyWith<$Res> {
  _$StreakEntryCopyWithImpl(this._value, this._then);

  final StreakEntry _value;
  // ignore: unused_field
  final $Res Function(StreakEntry) _then;

  @override
  $Res call({
    Object? entryId = freezed,
    Object? streak = freezed,
    Object? lastUpdate = freezed,
  }) {
    return _then(_value.copyWith(
      entryId: entryId == freezed
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as String,
      streak: streak == freezed
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$StreakEntryCopyWith<$Res>
    implements $StreakEntryCopyWith<$Res> {
  factory _$StreakEntryCopyWith(
          _StreakEntry value, $Res Function(_StreakEntry) then) =
      __$StreakEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String entryId,
      int streak,
      @DateTimeNullTimestampConverter() DateTime? lastUpdate});
}

/// @nodoc
class __$StreakEntryCopyWithImpl<$Res> extends _$StreakEntryCopyWithImpl<$Res>
    implements _$StreakEntryCopyWith<$Res> {
  __$StreakEntryCopyWithImpl(
      _StreakEntry _value, $Res Function(_StreakEntry) _then)
      : super(_value, (v) => _then(v as _StreakEntry));

  @override
  _StreakEntry get _value => super._value as _StreakEntry;

  @override
  $Res call({
    Object? entryId = freezed,
    Object? streak = freezed,
    Object? lastUpdate = freezed,
  }) {
    return _then(_StreakEntry(
      entryId: entryId == freezed
          ? _value.entryId
          : entryId // ignore: cast_nullable_to_non_nullable
              as String,
      streak: streak == freezed
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdate: lastUpdate == freezed
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StreakEntry implements _StreakEntry {
  _$_StreakEntry(
      {required this.entryId,
      required this.streak,
      @DateTimeNullTimestampConverter() required this.lastUpdate});

  factory _$_StreakEntry.fromJson(Map<String, dynamic> json) =>
      _$$_StreakEntryFromJson(json);

  @override
  final String entryId;
  @override
  final int streak;
  @override
  @DateTimeNullTimestampConverter()
  final DateTime? lastUpdate;

  @override
  String toString() {
    return 'StreakEntry(entryId: $entryId, streak: $streak, lastUpdate: $lastUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StreakEntry &&
            const DeepCollectionEquality().equals(other.entryId, entryId) &&
            const DeepCollectionEquality().equals(other.streak, streak) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdate, lastUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entryId),
      const DeepCollectionEquality().hash(streak),
      const DeepCollectionEquality().hash(lastUpdate));

  @JsonKey(ignore: true)
  @override
  _$StreakEntryCopyWith<_StreakEntry> get copyWith =>
      __$StreakEntryCopyWithImpl<_StreakEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StreakEntryToJson(this);
  }
}

abstract class _StreakEntry implements StreakEntry {
  factory _StreakEntry(
          {required String entryId,
          required int streak,
          @DateTimeNullTimestampConverter() required DateTime? lastUpdate}) =
      _$_StreakEntry;

  factory _StreakEntry.fromJson(Map<String, dynamic> json) =
      _$_StreakEntry.fromJson;

  @override
  String get entryId;
  @override
  int get streak;
  @override
  @DateTimeNullTimestampConverter()
  DateTime? get lastUpdate;
  @override
  @JsonKey(ignore: true)
  _$StreakEntryCopyWith<_StreakEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
