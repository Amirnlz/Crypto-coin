import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  Size get size => MediaQuery.of(this).size;

  double get height {
    return MediaQuery.of(this).size.height;
  }

  double get width {
    return MediaQuery.of(this).size.width;
  }
}
