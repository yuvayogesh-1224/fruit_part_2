import 'package:flutter/material.dart';

enum DrawingCategory {
  fruits,
  vegetables,
  cuteAnimals,
  wildAnimals,
  birds,
  flowers,
  nature,
  vehicles,
  dinosaurs,
  seaAnimals,
  space,
  fantasyCharacters,
  toys,
  food,
  cartoonObjects,
}

extension DrawingCategoryExtension on DrawingCategory {
  String get displayName {
    switch (this) {
      case DrawingCategory.fruits:
        return 'Fruits';
      case DrawingCategory.vegetables:
        return 'Vegetables';
      case DrawingCategory.cuteAnimals:
        return 'Cute Animals';
      case DrawingCategory.wildAnimals:
        return 'Wild Animals';
      case DrawingCategory.birds:
        return 'Birds';
      case DrawingCategory.flowers:
        return 'Flowers';
      case DrawingCategory.nature:
        return 'Nature';
      case DrawingCategory.vehicles:
        return 'Vehicles';
      case DrawingCategory.dinosaurs:
        return 'Dinosaurs';
      case DrawingCategory.seaAnimals:
        return 'Sea Animals';
      case DrawingCategory.space:
        return 'Space';
      case DrawingCategory.fantasyCharacters:
        return 'Fantasy';
      case DrawingCategory.toys:
        return 'Toys';
      case DrawingCategory.food:
        return 'Yummy Food';
      case DrawingCategory.cartoonObjects:
        return 'Cute Objects';
    }
  }

  IconData get icon {
    switch (this) {
      case DrawingCategory.fruits:
        return Icons.apple_rounded;
      case DrawingCategory.vegetables:
        return Icons.eco_rounded;
      case DrawingCategory.cuteAnimals:
        return Icons.pets_rounded;
      case DrawingCategory.wildAnimals:
        return Icons.cruelty_free_rounded;
      case DrawingCategory.birds:
        return Icons.flutter_dash_rounded;
      case DrawingCategory.flowers:
        return Icons.local_florist_rounded;
      case DrawingCategory.nature:
        return Icons.wb_sunny_rounded;
      case DrawingCategory.vehicles:
        return Icons.directions_car_rounded;
      case DrawingCategory.dinosaurs:
        return Icons.pest_control_rounded;
      case DrawingCategory.seaAnimals:
        return Icons.water_drop_rounded;
      case DrawingCategory.space:
        return Icons.rocket_launch_rounded;
      case DrawingCategory.fantasyCharacters:
        return Icons.auto_awesome_rounded;
      case DrawingCategory.toys:
        return Icons.smart_toy_rounded;
      case DrawingCategory.food:
        return Icons.icecream_rounded;
      case DrawingCategory.cartoonObjects:
        return Icons.category_rounded;
    }
  }

  Color get accentColor {
    switch (this) {
      case DrawingCategory.fruits:
        return const Color(0xFFFF6B6B);
      case DrawingCategory.vegetables:
        return const Color(0xFF4ECDC4);
      case DrawingCategory.cuteAnimals:
        return const Color(0xFFFFD166);
      case DrawingCategory.wildAnimals:
        return const Color(0xFFFF8E3C);
      case DrawingCategory.birds:
        return const Color(0xFF06D6A0);
      case DrawingCategory.flowers:
        return const Color(0xFFFF85A1);
      case DrawingCategory.nature:
        return const Color(0xFF118AB2);
      case DrawingCategory.vehicles:
        return const Color(0xFF3A86FF);
      case DrawingCategory.dinosaurs:
        return const Color(0xFF8338EC);
      case DrawingCategory.seaAnimals:
        return const Color(0xFF00B4D8);
      case DrawingCategory.space:
        return const Color(0xFF7209B7);
      case DrawingCategory.fantasyCharacters:
        return const Color(0xFFF72585);
      case DrawingCategory.toys:
        return const Color(0xFFFF9F1C);
      case DrawingCategory.food:
        return const Color(0xFFFF5964);
      case DrawingCategory.cartoonObjects:
        return const Color(0xFF2EC4B6);
    }
  }
}
