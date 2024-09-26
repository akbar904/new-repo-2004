
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:animal_switcher/models/animal.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model should correctly hold name and icon', () {
			// Arrange
			const animalName = 'Cat';
			const animalIcon = Icons.access_time;

			// Act
			final animal = Animal(animalName, animalIcon);

			// Assert
			expect(animal.name, animalName);
			expect(animal.icon, animalIcon);
		});

		test('Animal model should serialize and deserialize correctly', () {
			// Arrange
			const animalName = 'Dog';
			const animalIcon = Icons.person;
			final animal = Animal(animalName, animalIcon);
			final animalJson = {
				'name': animalName,
				'icon': Icons.person.codePoint, // Assuming serialization stores codePoint of the icon
			};

			// Act
			final animalFromJson = Animal.fromJson(animalJson);
			final animalToJson = animal.toJson();

			// Assert
			expect(animalFromJson.name, animalName);
			expect(animalFromJson.icon, animalIcon);
			expect(animalToJson['name'], animalName);
			expect(animalToJson['icon'], animalIcon.codePoint);
		});
	});
}
