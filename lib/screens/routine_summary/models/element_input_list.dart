import 'package:mindful/models/daily/daily_input_element.dart';
import 'package:mindful/models/entry_description/routine_element_description.dart';

class ElementInputList {
  final List<DateWrappedInput> inputs;
  RoutineElementDescription routineElement;

  ElementInputList(
    this.routineElement,
    this.inputs,
  );
}

class DateWrappedInput {
  DailyInputElement input;
  DateTime date;

  DateWrappedInput.name(this.input, this.date);
}
