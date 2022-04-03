// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_element_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutineElementDescription _$$_RoutineElementDescriptionFromJson(
        Map<String, dynamic> json) =>
    _$_RoutineElementDescription(
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$DailyEntryTypeEnumMap, json['type']),
      activeDays: (json['activeDays'] as List<dynamic>)
          .map((e) => $enumDecode(_$WeekdayEnumMap, e))
          .toSet(),
      entryId: json['entryId'] as String,
      image: json['image'] as String,
      active: json['active'] as bool,
      colorIndex: json['colorIndex'] as int,
    );

Map<String, dynamic> _$$_RoutineElementDescriptionToJson(
        _$_RoutineElementDescription instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'type': _$DailyEntryTypeEnumMap[instance.type],
      'activeDays':
          instance.activeDays.map((e) => _$WeekdayEnumMap[e]).toList(),
      'entryId': instance.entryId,
      'image': instance.image,
      'active': instance.active,
      'colorIndex': instance.colorIndex,
    };

const _$DailyEntryTypeEnumMap = {
  DailyEntryType.checkbox: 'checkbox',
  DailyEntryType.score: 'score',
  DailyEntryType.textList: 'textList',
  DailyEntryType.text: 'text',
};

const _$WeekdayEnumMap = {
  Weekday.mon: 'mon',
  Weekday.tue: 'tue',
  Weekday.wed: 'wed',
  Weekday.thu: 'thu',
  Weekday.fri: 'fri',
  Weekday.sat: 'sat',
  Weekday.sun: 'sun',
};
