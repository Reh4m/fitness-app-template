import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Text(
              'Plank Challenge',
              style: theme.textTheme.headlineSmall,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
