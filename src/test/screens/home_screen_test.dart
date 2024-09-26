
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.animal_switcher/screens/home_screen.dart';
import 'package:com.example.animal_switcher/cubits/animal_cubit.dart';
import 'package:com.example.animal_switcher/widgets/animal_widget.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat text with clock icon initially', (tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: 'Cat', icon: Icons.access_time));
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: animalCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog text with person icon after toggle', (tester) async {
			whenListen(animalCubit, Stream.fromIterable([AnimalState(animal: 'Dog', icon: Icons.person)]));
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: animalCubit,
						child: HomeScreen(),
					),
				),
			);
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('toggles animal when text is tapped', (tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: 'Cat', icon: Icons.access_time));
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: animalCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			verify(() => animalCubit.toggleAnimal()).called(1);
		});
	});
}
