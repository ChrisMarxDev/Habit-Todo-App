// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_input_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckBoxEntry _$$CheckBoxEntryFromJson(Map<String, dynamic> json) =>
    _$CheckBoxEntry(
      streak: json['streak'] as int? ?? 0,
      checked: json['checked'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CheckBoxEntryToJson(_$CheckBoxEntry instance) =>
    <String, dynamic>{
      'streak': instance.streak,
      'checked': instance.checked,
      'runtimeType': instance.$type,
    };

_$RatingEntry _$$RatingEntryFromJson(Map<String, dynamic> json) =>
    _$RatingEntry(
      streak: json['streak'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RatingEntryToJson(_$RatingEntry instance) =>
    <String, dynamic>{
      'streak': instance.streak,
      'rating': instance.rating,
      'runtimeType': instance.$type,
    };

_$TextListEntry _$$TextListEntryFromJson(Map<String, dynamic> json) =>
    _$TextListEntry(
      streak: json['streak'] as int? ?? 0,
      items:
          (json['items'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const <String>[],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TextListEntryToJson(_$TextListEntry instance) =>
    <String, dynamic>{
      'streak': instance.streak,
      'items': instance.items,
      'runtimeType': instance.$type,
    };

_$TextEntry _$$TextEntryFromJson(Map<String, dynamic> json) => _$TextEntry(
      streak: json['streak'] as int? ?? 0,
      text: json['text'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TextEntryToJson(_$TextEntry instance) =>
    <String, dynamic>{
      'streak': instance.streak,
      'text': instance.text,
      'runtimeType': instance.$type,
    };
