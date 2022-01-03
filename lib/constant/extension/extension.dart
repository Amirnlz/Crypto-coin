extension StringExtension on String {
  String get capitalize {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get coinWithoutSign {
    int signIndex = indexOfMinus;
    if (signIndex == -1) {
      return toString();
    } else {
      return toString().substring(signIndex + 1);
    }
  }

  int get indexOfMinus {
    if (toString().contains('-')) {
      return toString().indexOf('-');
    } else {
      return -1;
    }
  }
}

extension DoubleExtension on double {
  String get divideWithComma {
    return this >= 1
        ? toStringAsFixed(2)
            .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (match) => '${match[1]},')
            .coinWithoutSign
        : _lessThanNumberOne.coinWithoutSign;
  }

  String get _lessThanNumberOne =>
      this > 0 ? toStringAsFixed(4) : _lessThanZero;

  String get _lessThanZero =>
      this == 0 ? toStringAsFixed(2) : toStringAsFixed(5);

  String get getCoinStatusSign {
    if (toString().contains('-')) {
      return '-';
    } else {
      return '+';
    }
  }

  String get thousandsFormatter {
    if (this > 999 && this < 99999) {
      return '${(this / 1000).toStringAsFixed(1)} K';
    } else if (this > 99999 && this < 999999) {
      return '${(this / 1000).toStringAsFixed(0)} K';
    } else if (this > 999999 && this < 999999999) {
      return '${(this / 1000000).toStringAsFixed(1)} M';
    } else if (this > 999999999) {
      return '${(this / 1000000000).toStringAsFixed(1)} B';
    } else {
      return toString();
    }
  }

  double get removeDecimal {
    return this >= 1 ? double.parse(toString().split('.').first) : this;
  }
}
