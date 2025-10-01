import 'package:fitness_app/src/screens/home/widgets/popular_workouts_card.dart';
import 'package:fitness_app/src/screens/home/widgets/today_plan_card.dart';
import 'package:flutter/material.dart';

const popularWorkouts = [
  {
    'imageUrl': 'assets/images/popular_workouts_banner_1.png',
    'title': 'Lower Body Training',
    'calories': '500',
    'duration': '50 Min',
  },
  {
    'imageUrl': 'assets/images/popular_workouts_banner_1.png',
    'title': 'Hand Training',
    'calories': '600',
    'duration': '40 Min',
  },
];

const todayPlans = [
  {
    'imageUrl': 'assets/images/today_plan_1.png',
    'title': 'Push Up',
    'description': '100 Push up a day',
    'progress': '45',
    'level': 'Intermediate',
  },
  {
    'imageUrl': 'assets/images/today_plan_2.png',
    'title': 'Sit Up',
    'description': '20 Sit up a day',
    'progress': '75',
    'level': 'Beginner',
  },
  {
    'imageUrl': 'assets/images/today_plan_3.png',
    'title': 'Knee Push Up',
    'description': '10 Knee Push up a day',
    'progress': '20',
    'level': 'Beginner',
  },
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                _buildGreeting(theme),
                const SizedBox(height: 20),
                _buildSearchField(theme),
                const SizedBox(height: 20),
                _buildSectionTitle(theme, 'Popular Workouts'),
                const SizedBox(height: 20),
                _buildPopularWorkouts(),
                const SizedBox(height: 20),
                _buildSectionTitle(theme, 'Today Plan'),
                const SizedBox(height: 20),
                _buildTodayPlanSection(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGreeting(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Good Morning 🔥', style: theme.textTheme.titleSmall),
        const SizedBox(height: 5),
        Text('Pramyditya Uzumaki', style: theme.textTheme.displayLarge),
      ],
    );
  }

  Widget _buildSearchField(ThemeData theme) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          color: theme.primaryColor.withAlpha(127),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: theme.primaryColor.withAlpha(127),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: theme.cardColor,
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(title, style: theme.textTheme.headlineLarge);
  }

  Widget _buildPopularWorkouts() {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: popularWorkouts.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, index) {
          final workout = popularWorkouts[index];

          return PopularWorkoutsCard(
            imageUrl: workout['imageUrl']!,
            title: workout['title']!,
            calories: workout['calories']!,
            duration: workout['duration']!,
          );
        },
      ),
    );
  }

  Widget _buildTodayPlanSection() {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: todayPlans.length,
      separatorBuilder: (context, index) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final plan = todayPlans[index];

        return TodayPlanCard(
          imageUrl: plan['imageUrl']!,
          title: plan['title']!,
          description: plan['description']!,
          progress: double.parse(plan['progress']!),
          level: plan['level']!,
        );
      },
    );
  }
}
