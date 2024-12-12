import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superheroes/core/commons/domain/enums/screen_state.dart';
import 'package:superheroes/core/commons/ui/widgets/export_widgets.dart';
import 'package:superheroes/features/generator/export_generator.dart';

void main() {
  final mockGeneratorBloc = MockGeneratorBloc();
  testWidgets(
      'GeneratorPage displays loading indicator when generating superhero',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GeneratorPage(),
      ),
    );

    // Check initial state (ScreenState.empty)
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Simulate loading state
    when(mockGeneratorBloc.screenState)
        .thenReturn(ValueNotifier(ScreenState.loading));
    await tester.pumpAndSettle();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate error state
    when(mockGeneratorBloc.screenState)
        .thenReturn(ValueNotifier(ScreenState.error));
    await tester.pumpAndSettle();
    expect(find.byType(CustomErrorWidget), findsOneWidget);
  });
}

class MockGeneratorBloc extends Mock implements GeneratorBloc {}
