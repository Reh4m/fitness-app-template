import 'package:flutter/material.dart';

final weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

class HorizontalCalendar extends StatelessWidget {
  const HorizontalCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('July 2022', style: theme.textTheme.headlineLarge),
        const SizedBox(height: 20),
        SizedBox(
          height: 70,
          child: ListView.separated(
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              const firstDay = 10;
              final dayNumber = index + firstDay;
              final isCurrentDay = dayNumber == 12;

              return Column(
                children: <Widget>[
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color:
                          isCurrentDay
                              ? theme.colorScheme.primary
                              : theme.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          weekDays[index % 7],
                          style: theme.textTheme.titleSmall?.copyWith(
                            color:
                                isCurrentDay
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          '$dayNumber',
                          style: theme.textTheme.titleSmall?.copyWith(
                            color:
                                isCurrentDay
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isCurrentDay)
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
