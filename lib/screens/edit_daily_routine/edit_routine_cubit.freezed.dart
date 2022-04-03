// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'edit_routine_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EditRoutineStateTearOff {
  const _$EditRoutineStateTearOff();

  LoadingState loading() {
    return const LoadingState();
  }

  EmptyState empty() {
    return const EmptyState();
  }

  LoadedState loaded(
      {required DateTime timestamp,
      required List<RoutineElementDescription> entries}) {
    return LoadedState(
      timestamp: timestamp,
      entries: entries,
    );
  }
}

/// @nodoc
const $EditRoutineState = _$EditRoutineStateTearOff();

/// @nodoc
mixin _$EditRoutineState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(EmptyState value) empty,
    required TResult Function(LoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(EmptyState value)? empty,
    TResult Function(LoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(EmptyState value)? empty,
    TResult Function(LoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditRoutineStateCopyWith<$Res> {
  factory $EditRoutineStateCopyWith(
          EditRoutineState value, $Res Function(EditRoutineState) then) =
      _$EditRoutineStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EditRoutineStateCopyWithImpl<$Res>
    implements $EditRoutineStateCopyWith<$Res> {
  _$EditRoutineStateCopyWithImpl(this._value, this._then);

  final EditRoutineState _value;
  // ignore: unused_field
  final $Res Function(EditRoutineState) _then;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res>
    extends _$EditRoutineStateCopyWithImpl<$Res>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(
      LoadingState _value, $Res Function(LoadingState) _then)
      : super(_value, (v) => _then(v as LoadingState));

  @override
  LoadingState get _value => super._value as LoadingState;
}

/// @nodoc

class _$LoadingState implements LoadingState {
  const _$LoadingState();

  @override
  String toString() {
    return 'EditRoutineState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)?
        loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(EmptyState value) empty,
    required TResult Function(LoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(EmptyState value)? empty,
    TResult Function(LoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(EmptyState value)? empty,
    TResult Function(LoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements EditRoutineState {
  const factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class $EmptyStateCopyWith<$Res> {
  factory $EmptyStateCopyWith(
          EmptyState value, $Res Function(EmptyState) then) =
      _$EmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyStateCopyWithImpl<$Res>
    extends _$EditRoutineStateCopyWithImpl<$Res>
    implements $EmptyStateCopyWith<$Res> {
  _$EmptyStateCopyWithImpl(EmptyState _value, $Res Function(EmptyState) _then)
      : super(_value, (v) => _then(v as EmptyState));

  @override
  EmptyState get _value => super._value as EmptyState;
}

/// @nodoc

class _$EmptyState implements EmptyState {
  const _$EmptyState();

  @override
  String toString() {
    return 'EditRoutineState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)
        loaded,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)?
        loaded,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)?
        loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(EmptyState value) empty,
    required TResult Function(LoadedState value) loaded,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(EmptyState value)? empty,
    TResult Function(LoadedState value)? loaded,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(EmptyState value)? empty,
    TResult Function(LoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyState implements EditRoutineState {
  const factory EmptyState() = _$EmptyState;
}

/// @nodoc
abstract class $LoadedStateCopyWith<$Res> {
  factory $LoadedStateCopyWith(
          LoadedState value, $Res Function(LoadedState) then) =
      _$LoadedStateCopyWithImpl<$Res>;
  $Res call({DateTime timestamp, List<RoutineElementDescription> entries});
}

/// @nodoc
class _$LoadedStateCopyWithImpl<$Res>
    extends _$EditRoutineStateCopyWithImpl<$Res>
    implements $LoadedStateCopyWith<$Res> {
  _$LoadedStateCopyWithImpl(
      LoadedState _value, $Res Function(LoadedState) _then)
      : super(_value, (v) => _then(v as LoadedState));

  @override
  LoadedState get _value => super._value as LoadedState;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? entries = freezed,
  }) {
    return _then(LoadedState(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<RoutineElementDescription>,
    ));
  }
}

/// @nodoc

class _$LoadedState implements LoadedState {
  const _$LoadedState({required this.timestamp, required this.entries});

  @override
  final DateTime timestamp;
  @override
  final List<RoutineElementDescription> entries;

  @override
  String toString() {
    return 'EditRoutineState.loaded(timestamp: $timestamp, entries: $entries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadedState &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.entries, entries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(entries));

  @JsonKey(ignore: true)
  @override
  $LoadedStateCopyWith<LoadedState> get copyWith =>
      _$LoadedStateCopyWithImpl<LoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)
        loaded,
  }) {
    return loaded(timestamp, entries);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)?
        loaded,
  }) {
    return loaded?.call(timestamp, entries);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(
            DateTime timestamp, List<RoutineElementDescription> entries)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(timestamp, entries);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadingState value) loading,
    required TResult Function(EmptyState value) empty,
    required TResult Function(LoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(EmptyState value)? empty,
    TResult Function(LoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadingState value)? loading,
    TResult Function(EmptyState value)? empty,
    TResult Function(LoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedState implements EditRoutineState {
  const factory LoadedState(
      {required DateTime timestamp,
      required List<RoutineElementDescription> entries}) = _$LoadedState;

  DateTime get timestamp;
  List<RoutineElementDescription> get entries;
  @JsonKey(ignore: true)
  $LoadedStateCopyWith<LoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
