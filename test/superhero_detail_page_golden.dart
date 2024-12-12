import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

void main() {
  testWidgets('SuperheroDetailPage has consistent UI',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SuperheroDetailPage(
          superhero: Superhero(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(SuperheroDetailPage),
      matchesGoldenFile(
        'goldens/superhero_detail_page.png',
      ),
    );
  });
}
