
import 'package:flutter/material.dart';

class Animal {
	final String name;
	final IconData icon;

	Animal(this.name, this.icon);

	// Serialization
	Map<String, dynamic> toJson() {
		return {
			'name': name,
			'icon': icon.codePoint,
		};
	}

	// Deserialization
	factory Animal.fromJson(Map<String, dynamic> json) {
		return Animal(
			json['name'],
			IconData(json['icon'], fontFamily: 'MaterialIcons'),
		);
	}
}
