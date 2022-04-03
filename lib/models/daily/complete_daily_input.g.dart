// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_daily_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompleteDailyInput _$$_CompleteDailyInputFromJson(
        Map<String, dynamic> json) =>
    _$_CompleteDailyInput(
      entries: (json['entries'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, DailyInputElement.fromJson(e as Map<String, dynamic>)),
      ),
      date: const DateTimeTimestampConverter()
          .fromJson(json['date'] as Timestamp),
    );

Map<String, dynamic> _$$_CompleteDailyInputToJson(
        _$_CompleteDailyInput instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((k, e) => MapEntry(k, e.toJson())),
      'date': const DateTimeTimestampConverter().toJson(instance.date),
    };
