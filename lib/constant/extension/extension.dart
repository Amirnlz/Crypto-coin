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
    return toStringAsFixed(2).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (match) => '${match[1]},');
  }

  String get getCoinStatusSign {
    if (toString().contains('-')) {
      return '-';
    } else {
      return '+';
    }
  }
}
