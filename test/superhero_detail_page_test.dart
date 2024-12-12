import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superheroes/features/superheroes/export_superheroes.dart';

void main() {
  testWidgets('SuperheroDetailPage renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SuperheroDetailPage(
          superhero: Superhero(),
        ),
      ),
    );

    expect(find.byType(SingleChildScrollView), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Height'), findsOneWidget);
  });
}
