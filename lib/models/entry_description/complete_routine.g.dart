// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_routine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompleteRoutine _$$_CompleteRoutineFromJson(Map<String, dynamic> json) =>
    _$_CompleteRoutine(
      entries: (json['entries'] as List<dynamic>)
          .map((e) =>
              RoutineElementDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CompleteRoutineToJson(_$_CompleteRoutine instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((e) => e.toJson()).toList(),
    };
