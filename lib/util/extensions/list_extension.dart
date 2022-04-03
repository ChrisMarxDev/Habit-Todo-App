import 'dart:math';

extension ListUtil<T> on List<T> {
  T random() {
    final rng = Random();
    return this[rng.nextInt(length)];
  }

  T? get firstOrNull {
    if (isNotEmpty) {
      return first;
    } else {
      return null;
    }
  }
}

extension SetUtil<T> on Set<T> {
  // removes the element if it is present and adds it if it is not present
  Set<T> toggle(T element) {
    if (contains(element)) {
      return this..remove(element);
    } else {
      return this..add(element);
    }
  }

  T? get firstOrNull {
    if (isNotEmpty) {
      return first;
    } else {
      return null;
    }
  }
}
