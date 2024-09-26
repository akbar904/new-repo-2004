
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'lib/main.dart';

void main() {
	group('MyApp Widget Tests', () {
		testWidgets('App displays HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
