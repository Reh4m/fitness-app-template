import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool useInverseTextColor;

  const ChallengeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.useInverseTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Text(
              title,
              style: theme.textTheme.headlineLarge?.copyWith(
                color:
                    useInverseTextColor
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
