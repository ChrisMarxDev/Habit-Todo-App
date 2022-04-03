enum Weekday { mon, tue, wed, thu, fri, sat, sun }

extension WeekdayUtil on Weekday {
  String toStringKeyLong() {
    switch (this) {
      case Weekday.mon:
        return 'mon_long';
      case Weekday.tue:
        return 'tue_long';
      case Weekday.wed:
        return 'wed_long';
      case Weekday.thu:
        return 'thu_long';
      case Weekday.fri:
        return 'fri_long';
      case Weekday.sat:
        return 'sat_long';
      case Weekday.sun:
        return 'sun_long';
    }
  }

  String toStringKeyShort() {
    switch (this) {
      case Weekday.mon:
        return 'mon_short';
      case Weekday.tue:
        return 'tue_short';
      case Weekday.wed:
        return 'wed_short';
      case Weekday.thu:
        return 'thu_short';
      case Weekday.fri:
        return 'fri_short';
      case Weekday.sat:
        return 'sat_short';
      case Weekday.sun:
        return 'sun_short';
    }
  }
}
