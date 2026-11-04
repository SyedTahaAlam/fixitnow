import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class MapPlaceholder extends StatelessWidget {
  const MapPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(18),
    child: SizedBox(
      height: 230,
      child: Stack(
        children: [
          const Positioned.fill(child: CustomPaint(painter: _MapPainter())),
          const PositionedDirectional(
            start: 18,
            top: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RIYADH',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Your city. Your next adventure.',
                  style: TextStyle(fontSize: 9, color: AppTheme.muted),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: 16,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.local_taxi, size: 15, color: AppTheme.pink),
                  SizedBox(width: 6),
                  Text(
                    '6 min away \u00b7 Demo map',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _MapPainter extends CustomPainter {
  const _MapPainter();
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0xFFE9F0EF),
    );
    final block = Paint()..color = const Color(0xFFDAE4DF);
    for (var x = -20.0; x < size.width; x += 53) {
      for (var y = -15.0; y < size.height; y += 43) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x, y, 42, 33),
            const Radius.circular(4),
          ),
          block,
        );
      }
    }
    canvas.drawCircle(
      Offset(size.width * .76, 80),
      45,
      Paint()..color = const Color(0xFFC1DEC9),
    );
    final road = Paint()
      ..color = Colors.white
      ..strokeWidth = 12;
    canvas.drawLine(
      Offset(0, size.height * .8),
      Offset(size.width, size.height * .2),
      road,
    );
    canvas.drawLine(
      Offset(size.width * .4, 0),
      Offset(size.width * .7, size.height),
      road,
    );
    final start = Offset(size.width * .28, size.height * .72);
    final end = Offset(size.width * .73, size.height * .3);
    final route = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(size.width * .48, size.height * .56)
      ..lineTo(size.width * .6, size.height * .62)
      ..lineTo(end.dx, end.dy);
    canvas.drawPath(
      route,
      Paint()
        ..color = const Color(0xFF17A8F5)
        ..strokeWidth = 5
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round,
    );
    for (final (point, color) in [
      (start, const Color(0xFF17A8F5)),
      (end, AppTheme.pink),
    ]) {
      canvas.drawCircle(point, 11, Paint()..color = Colors.white);
      canvas.drawCircle(point, 7, Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(_MapPainter oldDelegate) => false;
}
