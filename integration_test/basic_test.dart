import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_try/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("group description", () {
    testWidgets("Basic Flutter Test", (widgetTester) async {
      app.main();
      await widgetTester.pump(const Duration(seconds: 2));
      expect(find.byKey(const Key("MainPage")).hitTestable(), findsOneWidget);
      await widgetTester.pump(const Duration(seconds: 2));
    });
  });
}
