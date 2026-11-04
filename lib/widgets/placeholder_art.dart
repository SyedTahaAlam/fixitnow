import 'package:flutter/material.dart';

class PlaceholderArt extends StatelessWidget {
  const PlaceholderArt({
    super.key,
    required this.icon,
    required this.color,
    this.dark = false,
    this.size = 64,
  });
  final IconData icon;
  final Color color;
  final bool dark;
  final double size;

  @override
  Widget build(BuildContext context) => ClipRect(
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: dark
              ? [color, const Color(0xFF071C35)]
              : [color.withValues(alpha: .08), color.withValues(alpha: .24)],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
            top: -25,
            end: -15,
            child: Container(
              width: size * 2.2,
              height: size * 2.2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: color.withValues(alpha: .16),
                  width: 22,
                ),
              ),
            ),
          ),
          Transform.rotate(
            angle: -.12,
            child: Icon(icon, size: size, color: dark ? Colors.white : color),
          ),
          PositionedDirectional(
            bottom: 10,
            start: 12,
            child: Row(
              children: List.generate(
                3,
                (index) => Container(
                  margin: const EdgeInsetsDirectional.only(end: 4),
                  height: 3,
                  width: index == 0 ? 20 : 6,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: .25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
