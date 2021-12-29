extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String coinWithoutSign() {
    int signIndex = indexOfMinus;
    if (signIndex == -1) {
      return this;
    } else {
      return substring(signIndex + 1);
    }
  }

  int get indexOfMinus {
    if (contains('-')) {
      return indexOf('-');
    } else {
      return -1;
    }
  }

  String get getCoinStatusSign {
    if (contains('-')) {
      return '-';
    } else {
      return '+';
    }
  }
}

extension DoubleExtension on double {
  String get divideWithComma {
    return toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},');
  }
}
