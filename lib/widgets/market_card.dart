import 'package:flutter/material.dart';

import '../models/product.dart';

class MarketCard extends StatelessWidget {
  const MarketCard({super.key, required this.product, required this.onTap});
  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE9EDF3)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            Text(
              product.price,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5),
            Text(
              product.meta,
              style: TextStyle(fontSize: 10, color: product.color),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 36,
              width: double.infinity,
              child: CustomPaint(
                painter: _Sparkline(
                  product.color,
                  falling: product.meta.startsWith('-'),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _Sparkline extends CustomPainter {
  const _Sparkline(this.color, {required this.falling});
  final Color color;
  final bool falling;
  @override
  void paint(Canvas canvas, Size size) {
    const points = [
      .85,
      .72,
      .79,
      .53,
      .64,
      .48,
      .57,
      .33,
      .39,
      .21,
      .29,
      .1,
      .2,
      .08,
    ];
    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final point = Offset(
        size.width * i / (points.length - 1),
        size.height * (falling ? 1 - points[i] : points[i]),
      );
      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }
    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: .22), color.withValues(alpha: 0)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(_Sparkline oldDelegate) =>
      oldDelegate.color != color || oldDelegate.falling != falling;
}
