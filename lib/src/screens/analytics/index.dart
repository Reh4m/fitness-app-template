import 'package:fitness_app/src/screens/analytics/widgets/horizontal_calendar.dart';
import 'package:fitness_app/src/screens/analytics/widgets/today_report/index.dart';
import 'package:flutter/material.dart';

const calendar = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 40),
                const HorizontalCalendar(),
                const SizedBox(height: 20),
                _buildSectionTitle(theme, 'Today Report'),
                const SizedBox(height: 20),
                const TodayReport(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(ThemeData theme, String title) {
    return Text(title, style: theme.textTheme.headlineLarge);
  }
}
