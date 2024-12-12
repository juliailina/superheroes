import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

void main() {
  testWidgets('SuperheroesPage displays different states correctly',
      (WidgetTester tester) async {
    // loading state
    await tester.pumpWidget(const MaterialApp(home: SuperheroesPage()));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(SuperheroesPage),
      matchesGoldenFile('goldens/superheroes_page_loading.png'),
    );

    // idle state (data loaded)
    await tester.pumpWidget(const MaterialApp(home: SuperheroesPage()));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(SuperheroesPage),
      matchesGoldenFile('goldens/superheroes_page_idle.png'),
    );

    // error state
    await tester.pumpWidget(const MaterialApp(home: SuperheroesPage()));
    await tester.pumpAndSettle();
    await expectLater(
      find.byType(SuperheroesPage),
      matchesGoldenFile('goldens/superheroes_page_error.png'),
    );
  });
}
