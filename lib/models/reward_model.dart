import 'package:flutter/material.dart';

class Achievement {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final int rewardCoins;
  final bool isUnlocked;

  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.rewardCoins,
    this.isUnlocked = false,
  });

  Achievement copyWith({bool? isUnlocked}) {
    return Achievement(
      id: id,
      title: title,
      description: description,
      icon: icon,
      rewardCoins: rewardCoins,
      isUnlocked: isUnlocked ?? this.isUnlocked,
    );
  }
}

class RewardSystem {
  static List<Achievement> getInitialAchievements() {
    return const [
      Achievement(
        id: 'first_drawing',
        title: 'First Masterpiece',
        description: 'Complete your very first coloring page!',
        icon: Icons.star_rounded,
        rewardCoins: 50,
      ),
      Achievement(
        id: 'fruit_fan',
        title: 'Fruity Colors',
        description: 'Color any 3 fruits completely!',
        icon: Icons.apple_rounded,
        rewardCoins: 75,
      ),
      Achievement(
        id: 'veggie_hero',
        title: 'Veggie Hero',
        description: 'Finish healthy vegetable drawings!',
        icon: Icons.eco_rounded,
        rewardCoins: 75,
      ),
      Achievement(
        id: 'animal_lover',
        title: 'Animal Explorer',
        description: 'Color 5 cute & wild animals!',
        icon: Icons.pets_rounded,
        rewardCoins: 100,
      ),
      Achievement(
        id: 'dino_master',
        title: 'Dino Master',
        description: 'Bring ancient dinosaurs to life!',
        icon: Icons.pest_control_rounded,
        rewardCoins: 100,
      ),
      Achievement(
        id: 'space_cadet',
        title: 'Galaxy Cadet',
        description: 'Color rockets, planets, and space!',
        icon: Icons.rocket_launch_rounded,
        rewardCoins: 120,
      ),
      Achievement(
        id: 'glitter_artist',
        title: 'Glitter Magic',
        description: 'Use the magical glitter brush 10 times!',
        icon: Icons.auto_awesome_rounded,
        rewardCoins: 80,
      ),
      Achievement(
        id: 'pro_artist',
        title: 'Art Legend',
        description: 'Complete 15 full coloring levels!',
        icon: Icons.military_tech_rounded,
        rewardCoins: 250,
      ),
    ];
  }
}
