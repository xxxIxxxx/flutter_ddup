// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CustomPaintCanvasPage extends StatelessWidget {
  const CustomPaintCanvasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomPaintCanvas'),
      ),
      body: Column(
        children: [
          RepaintBoundary(
            child: CustomPaint(
              size: const Size(320, 320),
              painter: MyPainter(),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: const Text('点击按钮')),
          const Text("""
因为按钮有涟漪动画，按钮和CustomPaint在同一个大画布上，所以会导致 CustomPaint 刷新。
CustomPaint 如果不使用 RepaintBoundary 包裹，
那么点击按钮会导致 Canvas 不必要的刷新。
使用 RepaintBoundary 包裹 CustomPaint 或者 ElevatedButton 都可解决刷新问题
"""),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final int count = 10;
  @override
  void paint(Canvas canvas, Size size) {
    print("paint");
    var rect = Offset.zero & size;
    drawChessBoard(canvas, rect);
    drawPieces(canvas, rect);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;

  void drawChessBoard(Canvas canvas, Rect rect) {
    final paint = Paint();

    // 棋盘背景色
    paint
      ..isAntiAlias = true // 抗锯齿
      ..style = PaintingStyle.fill // 填充
      ..color = Colors.blue; // 颜色
    canvas.drawRect(rect, paint);

    paint
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final width = rect.size.width;
    final height = rect.size.height;

    for (int i = 0; i < count; i++) {
      final x = width / count * i;
      final y = height / count * i;
      canvas.drawLine(Offset(x, 0), Offset(x, height), paint);
      canvas.drawLine(Offset(0, y), Offset(width, y), paint);
    }
  }

  void drawPieces(Canvas canvas, Rect rect) {
    final paint = Paint();
    paint
      ..isAntiAlias = true // 抗锯齿
      ..style = PaintingStyle.fill // 填充
      ..color = Colors.red; // 颜色

    double radius = rect.width / count / 2.0 - 5;

    canvas.drawCircle(
        Offset(rect.width / count * 5, rect.height / count * 5), radius, paint);

    paint
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    canvas.drawCircle(
        Offset(rect.width / count * 6, rect.height / count * 5), radius, paint);
  }
}
