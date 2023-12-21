import 'package:flutter/material.dart';
import 'package:longboardapp/services/models.dart';
import 'package:provider/provider.dart';

class AnimatedProgressBar extends StatelessWidget {
  final double value;
  final double height;

  const AnimatedProgressBar({super.key, required this.value, this.height = 12});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
      return Container(
        padding: const EdgeInsets.all(10),
        width: box.maxWidth,
        child: Stack(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.all(Radius.circular(height))),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInCubic,
              height: height,
              width: box.maxWidth * _floor(value),
              decoration: BoxDecoration(
                  color: _colorGen(value),
                  borderRadius: BorderRadius.all(Radius.circular(height))),
            )
          ],
        ),
      );
    });
  }
}

_floor(double value, [min = 0.0]) {
  return value.sign <= min ? min : value;
}

_colorGen(double value) {
  int rgb = (value * 255).toInt();
  return Colors.deepOrange.withGreen(rgb).withRed(255 - rgb);
}

class StyleProgress extends StatelessWidget {
  final Style style;
  const StyleProgress({super.key, required this.style});

  @override
  Widget build(BuildContext context) {
    Report report = Provider.of<Report>(context);
    return Row(
      children: [
        _progressCount(report, style),
        Expanded(
          child: AnimatedProgressBar(
              value: _calculateProgress(style, report), height: 8),
        )
      ],
    );
  }

  Widget _progressCount(Report report, Style style) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        '${report.Styles[style.id]?.length ?? 0} / ${style.tricks.length}',
        style: const TextStyle(fontSize: 10, color: Colors.grey),
      ),
    );
  }

  double _calculateProgress(Style style, Report report) {
    try {
      int totalTricks = style.tricks.length;
      int completedTricks = report.Styles[style.id].length;
      return completedTricks / totalTricks;
    } catch (err) {
      return 0.0;
    }
  }
}
