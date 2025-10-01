import 'package:flutter/material.dart';

class PopularWorkoutsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String calories;
  final String duration;

  const PopularWorkoutsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.calories,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: theme.textTheme.displayMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                _buildWorkoutInfo(
                  theme,
                  Icons.local_fire_department_outlined,
                  '$calories kcal',
                ),
                const SizedBox(height: 10),
                _buildWorkoutInfo(theme, Icons.schedule, duration),
              ],
            ),
          ),
          Flexible(
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutInfo(ThemeData theme, IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.cardColor.withAlpha(204), // 80% opacity
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, size: 16, color: theme.primaryColor),
          const SizedBox(width: 5),
          Text(text, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
