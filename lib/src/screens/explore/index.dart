import 'package:fitness_app/src/screens/explore/widgets/challenge_card.dart';
import 'package:fitness_app/src/screens/explore/widgets/workout_card.dart';
import 'package:flutter/material.dart';

final bestForYouWorkouts = [
  {
    'title': 'Belly fat burner',
    'image': 'assets/images/workout_1.png',
    'duration': '10 min',
    'level': 'Beginner',
  },
  {
    'title': 'Plank',
    'image': 'assets/images/workout_2.png',
    'duration': '5 min',
    'level': 'Expert',
  },
  {
    'title': 'Lose Fat',
    'image': 'assets/images/workout_3.png',
    'duration': '10 min',
    'level': 'Beginner',
  },
  {
    'title': 'Build Whider',
    'image': 'assets/images/workout_4.png',
    'duration': '30 min',
    'level': 'Intermediate',
  },
];

final challenges = [
  {
    'title': 'Plank Challenge',
    'imageUrl': 'assets/images/challenge_1.png',
    'useInverseTextColor': 'false',
  },
  {
    'title': 'Sprint Challenge',
    'imageUrl': 'assets/images/challenge_2.png',
    'useInverseTextColor': 'true',
  },
  {
    'title': 'Squat Challenge',
    'imageUrl': 'assets/images/challenge_3.png',
    'useInverseTextColor': 'false',
  },
];

final fastWarmupWorkouts = [
  {
    'title': 'Leg exercises',
    'image': 'assets/images/fast_warmup_1.png',
    'duration': '10 min',
    'level': 'Beginner',
  },
  {
    'title': 'Backward Lunges',
    'image': 'assets/images/fast_warmup_2.png',
    'duration': '5 min',
    'level': 'Beginner',
  },
];

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 40),
                _buildBanner(theme, size),
                const SizedBox(height: 20),
                _buildSectionTitle(theme, 'Best for you'),
                const SizedBox(height: 20),
                _buildWorkoutSection(),
                const SizedBox(height: 20),
                _buildSectionTitle(theme, 'Challenge'),
                const SizedBox(height: 20),
                _buildChallengeSection(),
                const SizedBox(height: 20),
                _buildSectionTitle(theme, 'Fast Warmup'),
                const SizedBox(height: 20),
                _buildFastWarmupSection(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBanner(ThemeData theme, Size size) {
    return Container(
      width: size.width,
      height: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/explore_banner.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Best Quarantine Workout',
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'See more',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: theme.colorScheme.secondary,
                      size: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(title, style: theme.textTheme.headlineLarge);
  }

  Widget _buildWorkoutSection() {
    return SizedBox(
      height: 220,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 220,
        ),
        itemCount: bestForYouWorkouts.length,
        itemBuilder: (_, index) {
          final workout = bestForYouWorkouts[index];

          return WorkoutCard(
            imageUrl: workout['image']!,
            title: workout['title']!,
            duration: workout['duration']!,
            level: workout['level']!,
          );
        },
      ),
    );
  }

  Widget _buildChallengeSection() {
    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: challenges.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final challenge = challenges[index];

          return ChallengeCard(
            imageUrl: challenge['imageUrl']!,
            title: challenge['title']!,
            useInverseTextColor: challenge['useInverseTextColor'] == 'true',
          );
        },
      ),
    );
  }

  Widget _buildFastWarmupSection() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: fastWarmupWorkouts.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, index) {
          final workout = fastWarmupWorkouts[index];

          return WorkoutCard(
            imageUrl: workout['image']!,
            title: workout['title']!,
            duration: workout['duration']!,
            level: workout['level']!,
          );
        },
      ),
    );
  }
}
