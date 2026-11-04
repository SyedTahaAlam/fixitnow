import 'package:flutter/material.dart';

import '../models/vertical.dart';
import '../theme/app_theme.dart';

class VerticalSwitcherBar extends StatelessWidget {
  const VerticalSwitcherBar({
    super.key,
    required this.verticals,
    required this.selected,
    required this.onSelected,
  });
  final List<Vertical> verticals;
  final VerticalId selected;
  final ValueChanged<Vertical> onSelected;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 88,
    child: ListView.separated(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 14),
      scrollDirection: Axis.horizontal,
      itemCount: verticals.length,
      separatorBuilder: (_, _) => const SizedBox(width: 8),
      itemBuilder: (context, index) {
        final vertical = verticals[index];
        final active = selected == vertical.id;
        return Semantics(
          selected: active,
          button: true,
          child: InkWell(
            key: ValueKey('vertical-${vertical.id.name}'),
            borderRadius: BorderRadius.circular(12),
            onTap: () => onSelected(vertical),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 83,
              decoration: BoxDecoration(
                gradient: active
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFFF98DE), Color(0xFFFF36AE)],
                      )
                    : null,
                color: active ? null : Colors.black.withValues(alpha: .22),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: active
                      ? const Color(0xFFFF9DDD)
                      : Colors.white.withValues(alpha: .08),
                ),
                boxShadow: active
                    ? [
                        BoxShadow(
                          color: AppTheme.pink.withValues(alpha: .35),
                          blurRadius: 12,
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    vertical.icon,
                    color: active ? AppTheme.navy : AppTheme.cyan,
                    size: 23,
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Text(
                      vertical.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 9,
                        height: 1.15,
                        fontWeight: FontWeight.w700,
                        color: active ? AppTheme.navy : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
