import 'package:flutter/material.dart';

class ExerciseItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;

  const ExerciseItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageUrl,
              width: 65,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title, style: theme.textTheme.titleLarge),
                const SizedBox(height: 5),
                Text(
                  time,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.colorScheme.primaryContainer.withAlpha(127),
                  ),
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
            onPressed: () {},
            iconSize: 20,
            icon: Icon(Icons.play_arrow, color: theme.colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
