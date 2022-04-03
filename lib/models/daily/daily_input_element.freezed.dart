// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'daily_input_element.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyInputElement _$DailyInputElementFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'checkBox':
      return CheckBoxEntry.fromJson(json);
    case 'rating':
      return RatingEntry.fromJson(json);
    case 'textList':
      return TextListEntry.fromJson(json);
    case 'text':
      return TextEntry.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DailyInputElement',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$DailyInputElementTearOff {
  const _$DailyInputElementTearOff();

  CheckBoxEntry checkBox({int streak = 0, bool checked = false}) {
    return CheckBoxEntry(
      streak: streak,
      checked: checked,
    );
  }

  RatingEntry rating({int streak = 0, double? rating}) {
    return RatingEntry(
      streak: streak,
      rating: rating,
    );
  }

  TextListEntry textList(
      {int streak = 0, List<String> items = const <String>[]}) {
    return TextListEntry(
      streak: streak,
      items: items,
    );
  }

  TextEntry text({int streak = 0, String? text}) {
    return TextEntry(
      streak: streak,
      text: text,
    );
  }

  DailyInputElement fromJson(Map<String, Object?> json) {
    return DailyInputElement.fromJson(json);
  }
}

/// @nodoc
const $DailyInputElement = _$DailyInputElementTearOff();

/// @nodoc
mixin _$DailyInputElement {
  int get streak => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streak, bool checked) checkBox,
    required TResult Function(int streak, double? rating) rating,
    required TResult Function(int streak, List<String> items) textList,
    required TResult Function(int streak, String? text) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckBoxEntry value) checkBox,
    required TResult Function(RatingEntry value) rating,
    required TResult Function(TextListEntry value) textList,
    required TResult Function(TextEntry value) text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyInputElementCopyWith<DailyInputElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyInputElementCopyWith<$Res> {
  factory $DailyInputElementCopyWith(
          DailyInputElement value, $Res Function(DailyInputElement) then) =
      _$DailyInputElementCopyWithImpl<$Res>;
  $Res call({int streak});
}

/// @nodoc
class _$DailyInputElementCopyWithImpl<$Res>
    implements $DailyInputElementCopyWith<$Res> {
  _$DailyInputElementCopyWithImpl(this._value, this._then);

  final DailyInputElement _value;
  // ignore: unused_field
  final $Res Function(DailyInputElement) _then;

  @override
  $Res call({
    Object? streak = freezed,
  }) {
    return _then(_value.copyWith(
      streak: streak == freezed
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class $CheckBoxEntryCopyWith<$Res>
    implements $DailyInputElementCopyWith<$Res> {
  factory $CheckBoxEntryCopyWith(
          CheckBoxEntry value, $Res Function(CheckBoxEntry) then) =
      _$CheckBoxEntryCopyWithImpl<$Res>;
  @override
  $Res call({int streak, bool checked});
}

/// @nodoc
class _$CheckBoxEntryCopyWithImpl<$Res>
    extends _$DailyInputElementCopyWithImpl<$Res>
    implements $CheckBoxEntryCopyWith<$Res> {
  _$CheckBoxEntryCopyWithImpl(
      CheckBoxEntry _value, $Res Function(CheckBoxEntry) _then)
      : super(_value, (v) => _then(v as CheckBoxEntry));

  @override
  CheckBoxEntry get _value => super._value as CheckBoxEntry;

  @override
  $Res call({
    Object? streak = freezed,
    Object? checked = freezed,
  }) {
    return _then(CheckBoxEntry(
      streak: streak == freezed
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      checked: checked == freezed
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckBoxEntry implements CheckBoxEntry {
  const _$CheckBoxEntry({this.streak = 0, this.checked = false, String? $type})
      : $type = $type ?? 'checkBox';

  factory _$CheckBoxEntry.fromJson(Map<String, dynamic> json) =>
      _$$CheckBoxEntryFromJson(json);

  @JsonKey()
  @override
  final int streak;
  @JsonKey()
  @override
  final bool checked;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DailyInputElement.checkBox(streak: $streak, checked: $checked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckBoxEntry &&
            const DeepCollectionEquality().equals(other.streak, streak) &&
            const DeepCollectionEquality().equals(other.checked, checked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(streak),
      const DeepCollectionEquality().hash(checked));

  @JsonKey(ignore: true)
  @override
  $CheckBoxEntryCopyWith<CheckBoxEntry> get copyWith =>
      _$CheckBoxEntryCopyWithImpl<CheckBoxEntry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streak, bool checked) checkBox,
    required TResult Function(int streak, double? rating) rating,
    required TResult Function(int streak, List<String> items) textList,
    required TResult Function(int streak, String? text) text,
  }) {
    return checkBox(streak, checked);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
  }) {
    return checkBox?.call(streak, checked);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
    required TResult orElse(),
  }) {
    if (checkBox != null) {
      return checkBox(streak, checked);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckBoxEntry value) checkBox,
    required TResult Function(RatingEntry value) rating,
    required TResult Function(TextListEntry value) textList,
    required TResult Function(TextEntry value) text,
  }) {
    return checkBox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
  }) {
    return checkBox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
    required TResult orElse(),
  }) {
    if (checkBox != null) {
      return checkBox(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckBoxEntryToJson(this);
  }
}

abstract class CheckBoxEntry implements DailyInputElement {
  const factory CheckBoxEntry({int streak, bool checked}) = _$CheckBoxEntry;

  factory CheckBoxEntry.fromJson(Map<String, dynamic> json) =
      _$CheckBoxEntry.fromJson;

  @override
  int get streak;
  bool get checked;
  @override
  @JsonKey(ignore: true)
  $CheckBoxEntryCopyWith<CheckBoxEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingEntryCopyWith<$Res>
    implements $DailyInputElementCopyWith<$Res> {
  factory $RatingEntryCopyWith(
          RatingEntry value, $Res Function(RatingEntry) then) =
      _$RatingEntryCopyWithImpl<$Res>;
  @override
  $Res call({int streak, double? rating});
}

/// @nodoc
class _$RatingEntryCopyWithImpl<$Res>
    extends _$DailyInputElementCopyWithImpl<$Res>
    implements $RatingEntryCopyWith<$Res> {
  _$RatingEntryCopyWithImpl(
      RatingEntry _value, $Res Function(RatingEntry) _then)
      : super(_value, (v) => _then(v as RatingEntry));

  @override
  RatingEntry get _value => super._value as RatingEntry;

  @override
  $Res call({
    Object? streak = freezed,
    Object? rating = freezed,
  }) {
    return _then(RatingEntry(
      streak: streak == freezed
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatingEntry implements RatingEntry {
  const _$RatingEntry({this.streak = 0, this.rating, String? $type})
      : $type = $type ?? 'rating';

  factory _$RatingEntry.fromJson(Map<String, dynamic> json) =>
      _$$RatingEntryFromJson(json);

  @JsonKey()
  @override
  final int streak;
  @override
  final double? rating;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DailyInputElement.rating(streak: $streak, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RatingEntry &&
            const DeepCollectionEquality().equals(other.streak, streak) &&
            const DeepCollectionEquality().equals(other.rating, rating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(streak),
      const DeepCollectionEquality().hash(rating));

  @JsonKey(ignore: true)
  @override
  $RatingEntryCopyWith<RatingEntry> get copyWith =>
      _$RatingEntryCopyWithImpl<RatingEntry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streak, bool checked) checkBox,
    required TResult Function(int streak, double? rating) rating,
    required TResult Function(int streak, List<String> items) textList,
    required TResult Function(int streak, String? text) text,
  }) {
    return rating(streak, this.rating);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
  }) {
    return rating?.call(streak, this.rating);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
    required TResult orElse(),
  }) {
    if (rating != null) {
      return rating(streak, this.rating);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckBoxEntry value) checkBox,
    required TResult Function(RatingEntry value) rating,
    required TResult Function(TextListEntry value) textList,
    required TResult Function(TextEntry value) text,
  }) {
    return rating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
  }) {
    return rating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
    required TResult orElse(),
  }) {
    if (rating != null) {
      return rating(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RatingEntryToJson(this);
  }
}

abstract class RatingEntry implements DailyInputElement {
  const factory RatingEntry({int streak, double? rating}) = _$RatingEntry;

  factory RatingEntry.fromJson(Map<String, dynamic> json) =
      _$RatingEntry.fromJson;

  @override
  int get streak;
  double? get rating;
  @override
  @JsonKey(ignore: true)
  $RatingEntryCopyWith<RatingEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextListEntryCopyWith<$Res>
    implements $DailyInputElementCopyWith<$Res> {
  factory $TextListEntryCopyWith(
          TextListEntry value, $Res Function(TextListEntry) then) =
      _$TextListEntryCopyWithImpl<$Res>;
  @override
  $Res call({int streak, List<String> items});
}

/// @nodoc
class _$TextListEntryCopyWithImpl<$Res>
    extends _$DailyInputElementCopyWithImpl<$Res>
    implements $TextListEntryCopyWith<$Res> {
  _$TextListEntryCopyWithImpl(
      TextListEntry _value, $Res Function(TextListEntry) _then)
      : super(_value, (v) => _then(v as TextListEntry));

  @override
  TextListEntry get _value => super._value as TextListEntry;

  @override
  $Res call({
    Object? streak = freezed,
    Object? items = freezed,
  }) {
    return _then(TextListEntry(
      streak: streak == freezed
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextListEntry implements TextListEntry {
  const _$TextListEntry(
      {this.streak = 0, this.items = const <String>[], String? $type})
      : $type = $type ?? 'textList';

  factory _$TextListEntry.fromJson(Map<String, dynamic> json) =>
      _$$TextListEntryFromJson(json);

  @JsonKey()
  @override
  final int streak;
  @JsonKey()
  @override
  final List<String> items;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DailyInputElement.textList(streak: $streak, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextListEntry &&
            const DeepCollectionEquality().equals(other.streak, streak) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(streak),
      const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  $TextListEntryCopyWith<TextListEntry> get copyWith =>
      _$TextListEntryCopyWithImpl<TextListEntry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streak, bool checked) checkBox,
    required TResult Function(int streak, double? rating) rating,
    required TResult Function(int streak, List<String> items) textList,
    required TResult Function(int streak, String? text) text,
  }) {
    return textList(streak, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
  }) {
    return textList?.call(streak, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
    required TResult orElse(),
  }) {
    if (textList != null) {
      return textList(streak, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckBoxEntry value) checkBox,
    required TResult Function(RatingEntry value) rating,
    required TResult Function(TextListEntry value) textList,
    required TResult Function(TextEntry value) text,
  }) {
    return textList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
  }) {
    return textList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
    required TResult orElse(),
  }) {
    if (textList != null) {
      return textList(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextListEntryToJson(this);
  }
}

abstract class TextListEntry implements DailyInputElement {
  const factory TextListEntry({int streak, List<String> items}) =
      _$TextListEntry;

  factory TextListEntry.fromJson(Map<String, dynamic> json) =
      _$TextListEntry.fromJson;

  @override
  int get streak;
  List<String> get items;
  @override
  @JsonKey(ignore: true)
  $TextListEntryCopyWith<TextListEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextEntryCopyWith<$Res>
    implements $DailyInputElementCopyWith<$Res> {
  factory $TextEntryCopyWith(TextEntry value, $Res Function(TextEntry) then) =
      _$TextEntryCopyWithImpl<$Res>;
  @override
  $Res call({int streak, String? text});
}

/// @nodoc
class _$TextEntryCopyWithImpl<$Res>
    extends _$DailyInputElementCopyWithImpl<$Res>
    implements $TextEntryCopyWith<$Res> {
  _$TextEntryCopyWithImpl(TextEntry _value, $Res Function(TextEntry) _then)
      : super(_value, (v) => _then(v as TextEntry));

  @override
  TextEntry get _value => super._value as TextEntry;

  @override
  $Res call({
    Object? streak = freezed,
    Object? text = freezed,
  }) {
    return _then(TextEntry(
      streak: streak == freezed
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextEntry implements TextEntry {
  const _$TextEntry({this.streak = 0, this.text, String? $type})
      : $type = $type ?? 'text';

  factory _$TextEntry.fromJson(Map<String, dynamic> json) =>
      _$$TextEntryFromJson(json);

  @JsonKey()
  @override
  final int streak;
  @override
  final String? text;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DailyInputElement.text(streak: $streak, text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextEntry &&
            const DeepCollectionEquality().equals(other.streak, streak) &&
            const DeepCollectionEquality().equals(other.text, text));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(streak),
      const DeepCollectionEquality().hash(text));

  @JsonKey(ignore: true)
  @override
  $TextEntryCopyWith<TextEntry> get copyWith =>
      _$TextEntryCopyWithImpl<TextEntry>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int streak, bool checked) checkBox,
    required TResult Function(int streak, double? rating) rating,
    required TResult Function(int streak, List<String> items) textList,
    required TResult Function(int streak, String? text) text,
  }) {
    return text(streak, this.text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
  }) {
    return text?.call(streak, this.text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int streak, bool checked)? checkBox,
    TResult Function(int streak, double? rating)? rating,
    TResult Function(int streak, List<String> items)? textList,
    TResult Function(int streak, String? text)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(streak, this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CheckBoxEntry value) checkBox,
    required TResult Function(RatingEntry value) rating,
    required TResult Function(TextListEntry value) textList,
    required TResult Function(TextEntry value) text,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CheckBoxEntry value)? checkBox,
    TResult Function(RatingEntry value)? rating,
    TResult Function(TextListEntry value)? textList,
    TResult Function(TextEntry value)? text,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextEntryToJson(this);
  }
}

abstract class TextEntry implements DailyInputElement {
  const factory TextEntry({int streak, String? text}) = _$TextEntry;

  factory TextEntry.fromJson(Map<String, dynamic> json) = _$TextEntry.fromJson;

  @override
  int get streak;
  String? get text;
  @override
  @JsonKey(ignore: true)
  $TextEntryCopyWith<TextEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
