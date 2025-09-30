import 'package:fitness_app/src/themes/color_palette.dart';
import 'package:flutter/material.dart';

class HeartRateCard extends StatelessWidget {
  const HeartRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorPalette.imperialRedLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: ColorPalette.imperialRedSecondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.monitor_heart_outlined,
                    color: ColorPalette.imperialRed,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 10),
                Text('Heart Rate', style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  size: const Size(double.infinity, 100),
                  painter: _HeartRateWavePainter(),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Text('79 Bpm', style: theme.textTheme.bodyMedium),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeartRateWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final wavePaint =
        Paint()
          ..color = ColorPalette.imperialRed
          ..strokeWidth = 5
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    final barHeights = [
      0.2,
      0.6,
      0.4,
      0.6,
      0.8,
      0.5,
      0.1,
      0.2,
      0.3,
      0.4,
      0.3,
      0.6,
      0.55,
      0.6,
      0.8,
      0.5,
      0.4,
      0.3,
      0.6,
      0.4,
      0.1,
    ];

    final barCount = barHeights.length;
    final barSpacing = size.width / (barCount + 1);
    final centerY = size.height / 2;

    for (int i = 0; i < barCount; i++) {
      final x = (i + 1) * barSpacing;
      final barHeight = size.height * 0.8 * barHeights[i];

      // Draw vertical bar centered
      canvas.drawLine(
        Offset(x, centerY - barHeight / 2),
        Offset(x, centerY + barHeight / 2),
        wavePaint,
      );
    }
  }

  @override
  bool shouldRepaint(_HeartRateWavePainter oldDelegate) => false;
}
