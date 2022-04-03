// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'summary_day_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SummaryDayItemTearOff {
  const _$SummaryDayItemTearOff();

  _SummaryDayItem call(
      {required CompletionState state, DailyInputElement? input}) {
    return _SummaryDayItem(
      state: state,
      input: input,
    );
  }
}

/// @nodoc
const $SummaryDayItem = _$SummaryDayItemTearOff();

/// @nodoc
mixin _$SummaryDayItem {
  CompletionState get state => throw _privateConstructorUsedError;
  DailyInputElement? get input => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SummaryDayItemCopyWith<SummaryDayItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryDayItemCopyWith<$Res> {
  factory $SummaryDayItemCopyWith(
          SummaryDayItem value, $Res Function(SummaryDayItem) then) =
      _$SummaryDayItemCopyWithImpl<$Res>;
  $Res call({CompletionState state, DailyInputElement? input});

  $DailyInputElementCopyWith<$Res>? get input;
}

/// @nodoc
class _$SummaryDayItemCopyWithImpl<$Res>
    implements $SummaryDayItemCopyWith<$Res> {
  _$SummaryDayItemCopyWithImpl(this._value, this._then);

  final SummaryDayItem _value;
  // ignore: unused_field
  final $Res Function(SummaryDayItem) _then;

  @override
  $Res call({
    Object? state = freezed,
    Object? input = freezed,
  }) {
    return _then(_value.copyWith(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as CompletionState,
      input: input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as DailyInputElement?,
    ));
  }

  @override
  $DailyInputElementCopyWith<$Res>? get input {
    if (_value.input == null) {
      return null;
    }

    return $DailyInputElementCopyWith<$Res>(_value.input!, (value) {
      return _then(_value.copyWith(input: value));
    });
  }
}

/// @nodoc
abstract class _$SummaryDayItemCopyWith<$Res>
    implements $SummaryDayItemCopyWith<$Res> {
  factory _$SummaryDayItemCopyWith(
          _SummaryDayItem value, $Res Function(_SummaryDayItem) then) =
      __$SummaryDayItemCopyWithImpl<$Res>;
  @override
  $Res call({CompletionState state, DailyInputElement? input});

  @override
  $DailyInputElementCopyWith<$Res>? get input;
}

/// @nodoc
class __$SummaryDayItemCopyWithImpl<$Res>
    extends _$SummaryDayItemCopyWithImpl<$Res>
    implements _$SummaryDayItemCopyWith<$Res> {
  __$SummaryDayItemCopyWithImpl(
      _SummaryDayItem _value, $Res Function(_SummaryDayItem) _then)
      : super(_value, (v) => _then(v as _SummaryDayItem));

  @override
  _SummaryDayItem get _value => super._value as _SummaryDayItem;

  @override
  $Res call({
    Object? state = freezed,
    Object? input = freezed,
  }) {
    return _then(_SummaryDayItem(
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as CompletionState,
      input: input == freezed
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as DailyInputElement?,
    ));
  }
}

/// @nodoc

class _$_SummaryDayItem implements _SummaryDayItem {
  _$_SummaryDayItem({required this.state, this.input});

  @override
  final CompletionState state;
  @override
  final DailyInputElement? input;

  @override
  String toString() {
    return 'SummaryDayItem(state: $state, input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SummaryDayItem &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.input, input));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(input));

  @JsonKey(ignore: true)
  @override
  _$SummaryDayItemCopyWith<_SummaryDayItem> get copyWith =>
      __$SummaryDayItemCopyWithImpl<_SummaryDayItem>(this, _$identity);
}

abstract class _SummaryDayItem implements SummaryDayItem {
  factory _SummaryDayItem(
      {required CompletionState state,
      DailyInputElement? input}) = _$_SummaryDayItem;

  @override
  CompletionState get state;
  @override
  DailyInputElement? get input;
  @override
  @JsonKey(ignore: true)
  _$SummaryDayItemCopyWith<_SummaryDayItem> get copyWith =>
      throw _privateConstructorUsedError;
}
