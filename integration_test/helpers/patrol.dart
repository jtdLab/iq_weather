import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/main_development.dart' as dev_app;
import 'package:patrol/patrol.dart';

extension PatrolTesterX on PatrolIntegrationTester {
  Future<void> startApp() async {
    // We use the development runner for integration testing.
    dev_app.main();
    await pumpAndSettle();
  }

  Future<void> verifyShows(Type type) async {
    final page = find.byType(type);
    await tester.pumpAndSettle();
    expect(page, findsOneWidget);
  }
}
