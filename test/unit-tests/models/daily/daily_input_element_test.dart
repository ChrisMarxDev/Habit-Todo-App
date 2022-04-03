import 'package:mindful/models/daily/daily_input_element.dart';
import 'package:mindful/models/daily_entry_types.dart';
import 'package:test/test.dart';

void main() {
  test('Runtime type operations', () {
    final emptyCheck =
        DailyInputElement.getEmptyByType(DailyEntryType.checkbox);
    final emptyScore = DailyInputElement.getEmptyByType(DailyEntryType.score);

    expect(
      DailyInputElement.matchesType(emptyCheck, DailyEntryType.checkbox),
      true,
      reason: '1',
    );
    expect(
      DailyInputElement.matchesType(emptyCheck, DailyEntryType.score),
      false,
      reason: '2',
    );
    expect(
      DailyInputElement.matchesType(emptyCheck, DailyEntryType.text),
      false,
      reason: '3',
    );
    expect(
      DailyInputElement.matchesType(emptyScore, DailyEntryType.checkbox),
      false,
      reason: '4',
    );
    expect(
      DailyInputElement.matchesType(emptyScore, DailyEntryType.score),
      true,
      reason: '5',
    );
  });
}
