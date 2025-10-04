import 'package:fitness_app/src/screens/workout/widgets/exercise_item.dart';
import 'package:fitness_app/src/themes/index.dart';
import 'package:fitness_app/src/widgets/common/primary_button.dart';
import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double bottomNavBarHeight = 48;

    return Theme(
      data: AppTheme.dark,
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);

          return Scaffold(
            body: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          _buildScreenHeader(context, theme),
                          const SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              _buildWorkoutImageBanner(theme),
                              Positioned(
                                bottom: 20,
                                child: _buildWorkoutDetails(theme),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildWorkoutDescription(theme),
                          const SizedBox(height: 20),
                          _buildRoundsSection(theme),
                          // Extra space to allow for scrolling above the button
                          const SizedBox(height: bottomNavBarHeight + 40),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: PrimaryButton(
                      onPressed: () {},
                      text: 'Lets Workout',
                      variant: ButtonColorVariant.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildScreenHeader(BuildContext context, ThemeData theme) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Expanded(
          child: Text(
            'Workout',
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineSmall,
          ),
        ),
        const SizedBox(width: 48),
      ],
    );
  }

  Widget _buildWorkoutImageBanner(ThemeData theme) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/workout_banner_image.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutDetails(ThemeData theme) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.timer_outlined,
                color: theme.colorScheme.onPrimary,
                size: 26,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Time', style: theme.textTheme.bodySmall),
                Text(
                  '20 min',
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: 1,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 25),
          color: theme.colorScheme.primaryContainer.withAlpha(63),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.local_fire_department_outlined,
            color: theme.colorScheme.onPrimary,
            size: 26,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Burn', style: theme.textTheme.bodySmall),
            Text(
              '95 Kcal',
              style: theme.textTheme.titleSmall?.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWorkoutDescription(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Lower Body Training', style: theme.textTheme.displayLarge),
        const SizedBox(height: 10),
        Text(
          'The lower abdomen and hips are the most difficult areas of the body to reduce when we are on a diet. Even so, in this area, especially the legs as a whole, you can reduce weight even if you don\'t use tools.',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primaryContainer.withAlpha(127),
          ),
        ),
      ],
    );
  }

  Widget _buildRoundsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Rounds', style: theme.textTheme.headlineLarge),
            RichText(
              text: TextSpan(
                text: '1',
                style: theme.textTheme.headlineLarge,
                children: <TextSpan>[
                  TextSpan(text: '/8', style: theme.textTheme.titleMedium),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Column(
          children: <Widget>[
            ExerciseItem(
              imageUrl: 'assets/images/jumping_jacks.jpeg',
              title: 'Jumping Jacks',
              time: '00:30',
            ),
            SizedBox(height: 10),
            ExerciseItem(
              imageUrl: 'assets/images/squats.jpeg',
              title: 'Squats',
              time: '00:30',
            ),
            SizedBox(height: 10),
            ExerciseItem(
              imageUrl: 'assets/images/backward_lunges.jpeg',
              title: 'Backward Lunge',
              time: '00:30',
            ),
          ],
        ),
      ],
    );
  }
}
