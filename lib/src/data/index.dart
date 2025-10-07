import 'package:fitness_app/src/models/workout_model.dart';

const List<Workout> bestForYouWorkouts = [
  Workout(
    title: 'Belly fat burner',
    imageUrl: 'assets/images/workout_1.png',
    duration: '10 min',
    level: 'Beginner',
  ),
  Workout(
    title: 'Plank',
    imageUrl: 'assets/images/workout_2.png',
    duration: '5 min',
    level: 'Expert',
  ),
  Workout(
    title: 'Lose Fat',
    imageUrl: 'assets/images/workout_3.png',
    duration: '10 min',
    level: 'Beginner',
  ),
  Workout(
    title: 'Build Whider',
    imageUrl: 'assets/images/workout_4.png',
    duration: '30 min',
    level: 'Intermediate',
  ),
];

const List<Workout> popularWorkouts = [
  Workout(
    title: 'Lower Body Training',
    imageUrl: 'assets/images/popular_workouts_banner_1.png',
    duration: '50 Min',
    level: 'Intermediate',
    calories: '500',
  ),
  Workout(
    title: 'Hand Training',
    imageUrl: 'assets/images/popular_workouts_banner_1.png',
    duration: '40 Min',
    level: 'Beginner',
    calories: '600',
  ),
];

const List<Workout> todayPlans = [
  Workout(
    title: 'Push Up',
    imageUrl: 'assets/images/today_plan_1.png',
    duration: '45 min',
    level: 'Intermediate',
    description: '100 Push up a day',
    progress: 45,
  ),
  Workout(
    title: 'Sit Up',
    imageUrl: 'assets/images/today_plan_2.png',
    duration: '75 min',
    level: 'Beginner',
    description: '20 Sit up a day',
    progress: 75,
  ),
  Workout(
    title: 'Knee Push Up',
    imageUrl: 'assets/images/today_plan_3.png',
    duration: '20 min',
    level: 'Beginner',
    description: '10 Knee Push up a day',
    progress: 20,
  ),
];

const List<Workout> fastWarmupWorkouts = [
  Workout(
    title: 'Leg exercises',
    imageUrl: 'assets/images/fast_warmup_1.png',
    duration: '10 min',
    level: 'Beginner',
  ),
  Workout(
    title: 'Backward Lunges',
    imageUrl: 'assets/images/fast_warmup_2.png',
    duration: '5 min',
    level: 'Beginner',
  ),
];
