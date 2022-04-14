import 'dart:math';

import 'package:flutter/material.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  const GradientCircularProgressIndicator(
      {Key? key,
      this.stroeWidth = 3.0,
      this.radius = 10.0,
      this.strokeCapRound = true,
      this.value = 0.0,
      this.backgroundColor = Colors.blue,
      this.totalAngle = 2 * pi,
      required this.colors,
      this.stops})
      : super(key: key);

  /// 粗细
  final double stroeWidth;

  /// 半径
  final double radius;

  /// 两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度  [0 -  1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条总弧度
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色终止点
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    if (strokeCapRound) {
      _offset = asin(stroeWidth / (radius * 2 - stroeWidth));
    }
    var _colors = colors;
    if (_colors.isEmpty) {
      var color = Theme.of(context).colorScheme.secondary;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: GradientCircularProgressPainter(stroeWidth, radius,
            strokeCapRound, value, backgroundColor, totalAngle, colors, stops),
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter(
    this.stroeWidth,
    this.radius,
    this.strokeCapRound,
    this.value,
    this.backgroundColor,
    this.totalAngle,
    this.colors,
    this.stops,
  );

  /// 粗细
  final double stroeWidth;

  /// 半径
  final double radius;

  /// 两端是否为圆角
  final bool strokeCapRound;

  /// 当前进度  [0 -  1.0]
  final double value;

  /// 进度条背景色
  final Color backgroundColor;

  /// 进度条总弧度
  final double totalAngle;

  /// 渐变色数组
  final List<Color> colors;

  /// 渐变色终止点
  final List<double>? stops;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double _offset = stroeWidth / 2.0;
    double _value = value.clamp(0, 1.0) * totalAngle;
    double _start = .0;
    if (strokeCapRound) {
      _start = asin(stroeWidth / (radius * 2 - stroeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - stroeWidth, size.height - stroeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = stroeWidth;

    // 先画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, totalAngle, false, paint);
    }

    // 再画前景，应用渐变
    if (_value > 0) {
      paint.shader = SweepGradient(
        startAngle: 0.0,
        endAngle: _value,
        colors: colors,
        stops: stops,
      ).createShader(rect);

      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  /// 实际应该根据属性是否变化返回
  @override
  bool shouldRepaint(GradientCircularProgressPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(GradientCircularProgressPainter oldDelegate) =>
      false;
}
