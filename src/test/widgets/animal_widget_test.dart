
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animal_switcher/widgets/animal_widget.dart';

void main() {
	group('AnimalWidget', () {
		testWidgets('displays cat text with clock icon', (WidgetTester tester) async {
			// Arrange
			const animal = 'Cat';
			const icon = Icons.access_time;

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalWidget(animal: animal, icon: icon),
					),
				),
			);

			// Assert
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays dog text with person icon', (WidgetTester tester) async {
			// Arrange
			const animal = 'Dog';
			const icon = Icons.person;

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: AnimalWidget(animal: animal, icon: icon),
					),
				),
			);

			// Assert
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
