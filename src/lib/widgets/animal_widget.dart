
import 'package:flutter/material.dart';

class AnimalWidget extends StatelessWidget {
	final String animal;
	final IconData icon;

	const AnimalWidget({required this.animal, required this.icon, Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				// Add your logic to toggle between cat and dog here if needed
			},
			child: Row(
				children: [
					Text(animal),
					SizedBox(width: 8),
					Icon(icon),
				],
			),
		);
	}
}
