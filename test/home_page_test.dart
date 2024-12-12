import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superheroes/features/home/export_home.dart';

void main() {
  testWidgets('HomePage widget test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.text('Superhero of the day'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
