import 'dart:math' as math;

import 'package:fitness_app/src/themes/color_palette.dart';
import 'package:flutter/material.dart';

class WaterIntakeSummaryCard extends StatelessWidget {
  const WaterIntakeSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorPalette.charcoalLight,
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
                    color: ColorPalette.charcoalSecondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.water_drop_outlined,
                    color: ColorPalette.charcoal,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 10),
                Text('Water Intake', style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CustomPaint(
                painter: _WaterLevelWavePainter(fillPercentage: 0.60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WaterLevelWavePainter extends CustomPainter {
  final double fillPercentage;

  _WaterLevelWavePainter({required this.fillPercentage});

  @override
  void paint(Canvas canvas, Size size) {
    final waterPaint =
        Paint()
          ..color = ColorPalette.skyblue
          ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '6/8 Cups',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF192126),
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Calculate water level
    final waterLevelY = size.height * (1 - fillPercentage);

    // Create wave path
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, waterLevelY);

    // Draw wave using sine curve
    const waveCount = 1;
    const waveHeight = 10.0;

    for (double i = 0; i <= size.width; i++) {
      final x = i;
      final y =
          waterLevelY +
          math.sin((i / size.width) * waveCount * 2 * math.pi) * waveHeight;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, waterPaint);

    // Draw text
    final textX = (size.width - textPainter.width) / 2;
    final textY = waterLevelY;
    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(_WaterLevelWavePainter oldDelegate) {
    return oldDelegate.fillPercentage != fillPercentage;
  }
}
