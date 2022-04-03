// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StreakEntry _$$_StreakEntryFromJson(Map<String, dynamic> json) =>
    _$_StreakEntry(
      entryId: json['entryId'] as String,
      streak: json['streak'] as int,
      lastUpdate: const DateTimeNullTimestampConverter()
          .fromJson(json['lastUpdate'] as Timestamp?),
    );

Map<String, dynamic> _$$_StreakEntryToJson(_$_StreakEntry instance) =>
    <String, dynamic>{
      'entryId': instance.entryId,
      'streak': instance.streak,
      'lastUpdate':
          const DateTimeNullTimestampConverter().toJson(instance.lastUpdate),
    };
