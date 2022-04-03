// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'daily_entry_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DailyEntryStateTearOff {
  const _$DailyEntryStateTearOff();

  DailyEntryInitialState init() {
    return const DailyEntryInitialState();
  }

  DailyEntryContentState content(
      {required List<CombinedEntryModel> entries,
      required DateTime timestamp}) {
    return DailyEntryContentState(
      entries: entries,
      timestamp: timestamp,
    );
  }
}

/// @nodoc
const $DailyEntryState = _$DailyEntryStateTearOff();

/// @nodoc
mixin _$DailyEntryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            List<CombinedEntryModel> entries, DateTime timestamp)
        content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<CombinedEntryModel> entries, DateTime timestamp)?
        content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<CombinedEntryModel> entries, DateTime timestamp)?
        content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyEntryInitialState value) init,
    required TResult Function(DailyEntryContentState value) content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DailyEntryInitialState value)? init,
    TResult Function(DailyEntryContentState value)? content,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyEntryInitialState value)? init,
    TResult Function(DailyEntryContentState value)? content,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyEntryStateCopyWith<$Res> {
  factory $DailyEntryStateCopyWith(
          DailyEntryState value, $Res Function(DailyEntryState) then) =
      _$DailyEntryStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DailyEntryStateCopyWithImpl<$Res>
    implements $DailyEntryStateCopyWith<$Res> {
  _$DailyEntryStateCopyWithImpl(this._value, this._then);

  final DailyEntryState _value;
  // ignore: unused_field
  final $Res Function(DailyEntryState) _then;
}

/// @nodoc
abstract class $DailyEntryInitialStateCopyWith<$Res> {
  factory $DailyEntryInitialStateCopyWith(DailyEntryInitialState value,
          $Res Function(DailyEntryInitialState) then) =
      _$DailyEntryInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DailyEntryInitialStateCopyWithImpl<$Res>
    extends _$DailyEntryStateCopyWithImpl<$Res>
    implements $DailyEntryInitialStateCopyWith<$Res> {
  _$DailyEntryInitialStateCopyWithImpl(DailyEntryInitialState _value,
      $Res Function(DailyEntryInitialState) _then)
      : super(_value, (v) => _then(v as DailyEntryInitialState));

  @override
  DailyEntryInitialState get _value => super._value as DailyEntryInitialState;
}

/// @nodoc

class _$DailyEntryInitialState implements DailyEntryInitialState {
  const _$DailyEntryInitialState();

  @override
  String toString() {
    return 'DailyEntryState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DailyEntryInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            List<CombinedEntryModel> entries, DateTime timestamp)
        content,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<CombinedEntryModel> entries, DateTime timestamp)?
        content,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<CombinedEntryModel> entries, DateTime timestamp)?
        content,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyEntryInitialState value) init,
    required TResult Function(DailyEntryContentState value) content,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DailyEntryInitialState value)? init,
    TResult Function(DailyEntryContentState value)? content,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyEntryInitialState value)? init,
    TResult Function(DailyEntryContentState value)? content,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class DailyEntryInitialState implements DailyEntryState {
  const factory DailyEntryInitialState() = _$DailyEntryInitialState;
}

/// @nodoc
abstract class $DailyEntryContentStateCopyWith<$Res> {
  factory $DailyEntryContentStateCopyWith(DailyEntryContentState value,
          $Res Function(DailyEntryContentState) then) =
      _$DailyEntryContentStateCopyWithImpl<$Res>;
  $Res call({List<CombinedEntryModel> entries, DateTime timestamp});
}

/// @nodoc
class _$DailyEntryContentStateCopyWithImpl<$Res>
    extends _$DailyEntryStateCopyWithImpl<$Res>
    implements $DailyEntryContentStateCopyWith<$Res> {
  _$DailyEntryContentStateCopyWithImpl(DailyEntryContentState _value,
      $Res Function(DailyEntryContentState) _then)
      : super(_value, (v) => _then(v as DailyEntryContentState));

  @override
  DailyEntryContentState get _value => super._value as DailyEntryContentState;

  @override
  $Res call({
    Object? entries = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(DailyEntryContentState(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<CombinedEntryModel>,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DailyEntryContentState implements DailyEntryContentState {
  const _$DailyEntryContentState(
      {required this.entries, required this.timestamp});

  @override
  final List<CombinedEntryModel> entries;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'DailyEntryState.content(entries: $entries, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DailyEntryContentState &&
            const DeepCollectionEquality().equals(other.entries, entries) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(entries),
      const DeepCollectionEquality().hash(timestamp));

  @JsonKey(ignore: true)
  @override
  $DailyEntryContentStateCopyWith<DailyEntryContentState> get copyWith =>
      _$DailyEntryContentStateCopyWithImpl<DailyEntryContentState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(
            List<CombinedEntryModel> entries, DateTime timestamp)
        content,
  }) {
    return content(entries, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<CombinedEntryModel> entries, DateTime timestamp)?
        content,
  }) {
    return content?.call(entries, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(List<CombinedEntryModel> entries, DateTime timestamp)?
        content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(entries, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DailyEntryInitialState value) init,
    required TResult Function(DailyEntryContentState value) content,
  }) {
    return content(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DailyEntryInitialState value)? init,
    TResult Function(DailyEntryContentState value)? content,
  }) {
    return content?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DailyEntryInitialState value)? init,
    TResult Function(DailyEntryContentState value)? content,
    required TResult orElse(),
  }) {
    if (content != null) {
      return content(this);
    }
    return orElse();
  }
}

abstract class DailyEntryContentState implements DailyEntryState {
  const factory DailyEntryContentState(
      {required List<CombinedEntryModel> entries,
      required DateTime timestamp}) = _$DailyEntryContentState;

  List<CombinedEntryModel> get entries;
  DateTime get timestamp;
  @JsonKey(ignore: true)
  $DailyEntryContentStateCopyWith<DailyEntryContentState> get copyWith =>
      throw _privateConstructorUsedError;
}
