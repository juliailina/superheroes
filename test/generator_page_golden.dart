import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superheroes/features/generator/export_generator.dart';

void main() {
  testWidgets('GeneratorPage has consistent UI', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GeneratorPage(),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(GeneratorPage),
      matchesGoldenFile(
        'goldens/generator_page.png',
      ),
    );
  });
}
