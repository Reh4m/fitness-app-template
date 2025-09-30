import 'package:fitness_app/src/themes/color_palette.dart';
import 'package:flutter/material.dart';

class SleepSummaryCard extends StatelessWidget {
  const SleepSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorPalette.russianVioletLight,
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
                    color: ColorPalette.russianVioletSecondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.nightlight_outlined,
                    color: ColorPalette.russianViolet,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 10),
                Text('Sleep', style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 70,
            width: double.infinity,
            child: CustomPaint(
              size: const Size(double.infinity, 100),
              painter: _SleepBarChartPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SleepBarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final sleepBarPaint =
        Paint()
          ..color = ColorPalette.russianViolet
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final backgroundBarPaint =
        Paint()
          ..color = ColorPalette.russianVioletTerteary
          ..strokeWidth = 8
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final totalBars = 12;
    final barSpacing = size.width / (totalBars + 1);

    // Heights as percentages of the chart height
    final sleepStageHeights = [
      0.3,
      0.5,
      0.2,
      0.6,
      0.8,
      0.15,
      0.5,
      0.1,
      0.75,
      0.4,
      0.5,
      0.35,
    ];

    // Draw background bars
    for (int i = 0; i < totalBars; i++) {
      final x = (i + 1) * barSpacing;
      canvas.drawLine(
        Offset(x, size.height * 0.1),
        Offset(x, size.height * 0.9),
        backgroundBarPaint,
      );
    }

    // Draw sleep bars
    for (int i = 0; i < totalBars; i++) {
      final x = (i + 1) * barSpacing;
      final barHeight = size.height * 0.8 * sleepStageHeights[i];
      final barStartY = size.height * 0.9;
      final barEndY = barStartY - barHeight;

      canvas.drawLine(Offset(x, barStartY), Offset(x, barEndY), sleepBarPaint);
    }
  }

  @override
  bool shouldRepaint(_SleepBarChartPainter oldDelegate) => false;
}
