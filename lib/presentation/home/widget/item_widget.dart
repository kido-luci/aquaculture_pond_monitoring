import 'dart:async';
import 'dart:math';

import 'package:aquaculture_pond_monitoring/core/models/painter.dart';
import 'package:aquaculture_pond_monitoring/presentation/widget/app_text.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final String Function(double value) getValueText;
  final Widget Function(double value) getDescription;
  final double minValue, maxValue;

  const ItemWidget({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.getValueText,
    required this.getDescription,
  });

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  late double value;
  var circle = 0.0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    value = (widget.maxValue + widget.minValue) / 2;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          final add = (Random().nextInt(5) - 2) / 10;
          value = value + add;
          value = max(widget.minValue, value);
          value = min(widget.maxValue, value);

          circle = -0.25 +
              (((value - widget.minValue) * (0.25 + 0.25)) /
                  (widget.maxValue - widget.minValue));
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final size = constrains.maxWidth;

      return Stack(
        children: [
          Container(
            height: size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 80, 97, 100),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white10),
            ),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 71, 71, 71),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white24),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 12),
                ],
              ),
              child: Transform.rotate(
                angle: 1.2,
                child: CustomPaint(
                  size: Size.square(size - 36),
                  painter: GradientArcPainter(
                    strokeWidth: 10,
                    gradientColors: [
                      Colors.purple,
                      Colors.blue,
                      Colors.cyan,
                      Colors.yellow,
                      Colors.red,
                    ],
                    startAngle: pi / 2,
                    sweepAngle: 2.5 * pi / 2,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: size,
            width: size,
            alignment: Alignment.center,
            child: Container(
              height: size - 55,
              width: size - 55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(color: Colors.cyan, blurRadius: 8),
                ],
              ),
              child: Container(
                height: size - 60,
                width: size - 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 44, 51, 53),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      widget.getValueText(value),
                      fontSize: 26,
                      height: 1.2,
                    ),
                    widget.getDescription(value),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            child: AnimatedRotation(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              // turns: pi * (1.5 + circle),
              // turns: -0.25,
              turns: circle,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomPaint(
                    size: Size(8, size - 140),
                    painter: TrianglePainter(
                      color: Colors.white.withOpacity(0.9),
                      isFilled: true,
                    ),
                  ),
                  SizedBox(height: size - 105),
                  SizedBox(height: size - 140),
                ],
              ),
            ),
          ),
          ...List.generate(
            9,
            (index) => Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: pi * (-0.5 + (index * 0.125)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: size - 170,
                      width: 2,
                      decoration: const BoxDecoration(color: Colors.white70),
                    ),
                    SizedBox(height: size - 105),
                    SizedBox(height: size - 140),
                  ],
                ),
              ),
            ),
          ),
          ...List.generate(
            3,
            (index) => Container(
              width: size,
              height: size,
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: pi * (-0.5 + (index * 0.5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: size - 165,
                      width: 2.5,
                      decoration: const BoxDecoration(color: Colors.white),
                    ),
                    SizedBox(height: size - 105),
                    SizedBox(height: size - 140),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
