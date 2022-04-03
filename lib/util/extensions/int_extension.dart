import 'package:easy_localization/easy_localization.dart';

extension IntUtils on int {
  String getStringForMonth() {
    switch (this) {
      case 1:
        return tr('january');
      case 2:
        return tr('february');
      case 3:
        return tr('march');
      case 4:
        return tr('april');
      case 5:
        return tr('may');
      case 6:
        return tr('june');
      case 7:
        return tr('july');
      case 8:
        return tr('august');
      case 9:
        return tr('september');
      case 10:
        return tr('oktober');
      case 11:
        return tr('november');
      case 12:
        return tr('december');
      default:
        return tr('january');
    }
  }

  String getStreakIcons() {
    if (this == 0) {
      return '';
    } else if (this < 3) {
      return '🎉';
    } else if (this < 10) {
      return '🔥';
    } else if (this < 30) {
      return '🔥🔥';
    } else {
      return '🔥🔥🔥';
    }
  }
}
