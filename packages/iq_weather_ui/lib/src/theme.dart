import 'package:flutter/material.dart';

/// Namespace for the DartSense [ThemeData].
class DartSenseTheme {
  /// Standard `ThemeData` for DartSense UI.
  static ThemeData get standard {
    return ThemeData.light(useMaterial3: true);
  }
}

/// Namespace for the Dark DartSense [ThemeData].
class DartSenseDarkTheme {
  /// Dark `ThemeData` for DartSense UI.
  static ThemeData get standard {
    return ThemeData.dark(useMaterial3: true);
  }
}
