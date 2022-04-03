import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

class DateTimeTimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeTimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime json) => Timestamp.fromDate(json);
}

class DateTimeNullTimestampConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const DateTimeNullTimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    if (json == null) {
      return null;
    } else {
      return json.toDate();
    }
  }

  @override
  Timestamp? toJson(DateTime? json) {
    if (json == null) {
      return null;
    } else {
      return Timestamp.fromDate(json);
    }
  }
}
