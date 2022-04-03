import 'package:flutter_test/flutter_test.dart';
import 'package:mindful/models/weekdays.dart';
import 'package:mindful/util/extensions/date_time_extension.dart';

// class MockService extends Mock implements Service {}

void main() {
  setUp(() {});

  test('toWeekday', () async {
    expect(DateTime(2022, 1, 2).toWeekday(), Weekday.sun);
    expect(DateTime(2022, 1, 3).toWeekday(), Weekday.mon);
    expect(DateTime(2022, 1, 4).toWeekday(), Weekday.tue);
    expect(DateTime(2022, 1, 5).toWeekday(), Weekday.wed);
    expect(DateTime(2022, 1, 6).toWeekday(), Weekday.thu);
    expect(DateTime(2022, 1, 7).toWeekday(), Weekday.fri);
    expect(DateTime(2022, 1, 8).toWeekday(), Weekday.sat);
  });

  test('Test', () async {
    expect(DateTime(2022, 1, 2).getWeekOffset(), 5);
    expect(DateTime(2022, 2, 3).getWeekOffset(), 1);
    expect(DateTime(2022, 3, 4).getWeekOffset(), 1);
    expect(DateTime(2022, 4, 5).getWeekOffset(), 4);
    expect(DateTime(2022, 5, 6).getWeekOffset(), 6);
  });
}
