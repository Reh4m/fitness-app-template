import 'package:flutter/material.dart';

class TodayPlanCard extends StatelessWidget {
  const TodayPlanCard({super.key});

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
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/today_plan_section_1.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildPlanDetails(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Push Up', style: theme.textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(
          '100 Push up a day',
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
          width: 75,
          height: 20,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(child: Text('25%', style: theme.textTheme.labelSmall)),
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
        'Intermediate',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
