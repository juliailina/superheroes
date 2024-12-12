import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

void main() {
  testWidgets('SuperheroesPage displays a list of superheroes',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SuperheroesPage()),
    );

    expect(find.text('Abomination'), findsOneWidget);
    expect(find.text('Misfit'), findsOneWidget);
  });
}
