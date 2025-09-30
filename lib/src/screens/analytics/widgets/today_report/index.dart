import 'package:fitness_app/src/screens/analytics/widgets/today_report/widgets/heart_rate_card.dart';
import 'package:fitness_app/src/screens/analytics/widgets/today_report/widgets/sleep_summary_card.dart';
import 'package:fitness_app/src/screens/analytics/widgets/today_report/widgets/water_intake_summary_card.dart';
import 'package:fitness_app/src/themes/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TodayReport extends StatelessWidget {
  const TodayReport({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StaggeredGrid.count(
      crossAxisCount: 12,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      axisDirection: AxisDirection.down,
      children: <Widget>[
        StaggeredGridTile.count(
          crossAxisCellCount: 5,
          mainAxisCellCount: 3,
          child: _buildActiveCaloriesSummaryCard(theme),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 7,
          mainAxisCellCount: 8,
          child: _buildCyclingMapCard(theme),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 5,
          mainAxisCellCount: 5,
          child: _buildTrainingTimeProgressCard(theme),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 7,
          mainAxisCellCount: 6,
          child: HeartRateCard(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 5,
          mainAxisCellCount: 4,
          child: _buildStepsProgressCard(theme),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 5,
          mainAxisCellCount: 2,
          child: _buildMotivationMessageCard(theme),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 6,
          mainAxisCellCount: 5,
          child: SleepSummaryCard(),
        ),
        const StaggeredGridTile.count(
          crossAxisCellCount: 6,
          mainAxisCellCount: 5,
          child: WaterIntakeSummaryCard(),
        ),
      ],
    );
  }

  static Widget _buildActiveCaloriesSummaryCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withAlpha(25)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Active calories',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.primary.withAlpha(127),
            ),
          ),
          const SizedBox(height: 5),
          Text('645 Cal', style: theme.textTheme.headlineSmall),
        ],
      ),
    );
  }

  static Widget _buildTrainingTimeProgressCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorPalette.tropicalIndigoLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Training time', style: theme.textTheme.titleSmall),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 65,
              width: 65,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  CircularProgressIndicator(
                    value: 0.8,
                    color: ColorPalette.tropicalIndigo,
                    backgroundColor: theme.colorScheme.surface,
                    semanticsValue: '80%',
                    semanticsLabel: 'Training progress',
                    strokeWidth: 10,
                    strokeCap: StrokeCap.round,
                  ),
                  Center(
                    child: Text(
                      '80%',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildMotivationMessageCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorPalette.imperialRedTertiary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text('Keep it Up! 💪', style: theme.textTheme.headlineSmall),
      ),
    );
  }

  static Widget _buildStepsProgressCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorPalette.hunyadiYellowLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: ColorPalette.hunyadiYellowSecondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.directions_walk,
                    color: ColorPalette.hunyadiYellowDark,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 10),
                Text('Steps', style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(child: Text('999/2000', style: theme.textTheme.titleSmall)),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: 0.75,
            color: ColorPalette.hunyadiYellow,
            backgroundColor: ColorPalette.hunyadiYellowTertiary,
            semanticsValue: '75%',
            semanticsLabel: 'Steps progress',
            borderRadius: BorderRadius.circular(8),
            minHeight: 12,
          ),
        ],
      ),
    );
  }

  static Widget _buildCyclingMapCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.directions_bike,
                    color: theme.colorScheme.primary,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Cycling',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/images/map_chart.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
