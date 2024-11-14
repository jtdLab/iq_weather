// ignore_for_file: prefer_const_declarations

import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/repositories/weather/weather.dart';

import '../../../mocks.dart';

void main() {
  group(Weather, () {
    test('equality', () {
      final instance1 = weather;
      final instance2 = Weather.empty;
      expect(instance1, instance1);
      expect(instance1, isNot(instance2));
    });

    test('isEmpty', () {
      expect(Weather.empty.isEmpty, true);
      expect(weather.isEmpty, false);
    });
  });
}
