import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 220,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/today_plan_section_1.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Belly fat burner', style: theme.textTheme.titleSmall),
                const SizedBox(height: 10),
                _buildInfoBadge(theme, '10 min'),
                const SizedBox(height: 6),
                _buildInfoBadge(theme, 'Beginner'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBadge(ThemeData theme, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[Text(text, style: theme.textTheme.bodySmall)],
      ),
    );
  }
}
