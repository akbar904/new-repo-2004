
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:animal_switcher/cubits/animal_cubit.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is AnimalState with cat', () {
			expect(animalCubit.state, AnimalState(animal: 'Cat', icon: Icons.access_time));
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(dog)] when toggleAnimal is called from cat',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState(animal: 'Dog', icon: Icons.person)],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(cat)] when toggleAnimal is called from dog',
			build: () => animalCubit,
			seed: () => AnimalState(animal: 'Dog', icon: Icons.person),
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [AnimalState(animal: 'Cat', icon: Icons.access_time)],
		);
	});
}
