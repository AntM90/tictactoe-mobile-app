import 'package:flutter/material.dart';

class GridBackground extends StatelessWidget {
  final Widget child;
  final double cellSize;

  const GridBackground({
    required this.child,
    this.cellSize = 32,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(cellSize: cellSize),
      child: child,
    );
  }
}

class _GridPainter extends CustomPainter {
  final double cellSize;

  _GridPainter({required this.cellSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0x0AFFFFFF)
      ..strokeWidth = 1;

    for (double x = 0; x <= size.width; x += cellSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += cellSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_GridPainter oldDelegate) =>
      oldDelegate.cellSize != cellSize;
}
