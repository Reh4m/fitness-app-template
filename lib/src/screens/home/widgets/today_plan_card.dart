import 'package:flutter/material.dart';

class TodayPlanCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double progress;
  final String level;

  const TodayPlanCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.progress,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _buildPlanImage(),
                const SizedBox(width: 15),
                Expanded(child: _buildPlanDetails(theme)),
              ],
            ),
          ),
          Positioned(top: 0, right: 0, child: _buildPlanLevelBadge(theme)),
        ],
      ),
    );
  }

  Widget _buildPlanImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
    );
  }

  Widget _buildPlanDetails(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: theme.textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(
          description,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.primaryColor.withAlpha(127), // 50% opacity
          ),
        ),
        const SizedBox(height: 15),
        _buildProgressBar(theme),
      ],
    );
  }

  Widget _buildProgressBar(ThemeData theme) {
    return Container(
      width: double.infinity,
      height: 20,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: progress,
          height: 20,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text('$progress%', style: theme.textTheme.labelSmall),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanLevelBadge(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Text(
        level,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
