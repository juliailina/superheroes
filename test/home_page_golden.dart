import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superheroes/features/home/ui/page/home_page.dart';

void main() {
  testWidgets('HomePage has consistent UI', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(HomePage),
      matchesGoldenFile(
        'goldens/home_page.png',
      ),
    );
  });
}
