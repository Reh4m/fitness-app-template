import 'package:fitness_app/src/screens/analytics/index.dart';
import 'package:fitness_app/src/screens/explore/index.dart';
import 'package:fitness_app/src/screens/home/index.dart';
import 'package:fitness_app/src/screens/onboarding_screen.dart';
import 'package:fitness_app/src/screens/root_screen.dart';
import 'package:fitness_app/src/screens/workout/index.dart';
import 'package:fitness_app/src/themes/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness App',
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const RootScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/explore': (context) => const ExploreScreen(),
        '/analytics': (context) => const AnalyticsScreen(),
        '/workout': (context) => const WorkoutScreen(),
      },
    );
  }
}
