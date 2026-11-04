import 'package:flutter/material.dart';

import '../models/banner.dart';
import '../theme/app_theme.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({
    super.key,
    required this.banner,
    required this.onTap,
    this.compact = false,
  });
  final BannerData banner;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: banner.title,
    child: Material(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(compact ? 12 : 18),
      color: AppTheme.navy,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.centerStart,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [AppTheme.navy, banner.color],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              end: compact ? -18 : -10,
              top: compact ? 20 : 26,
              child: Container(
                width: compact ? 110 : 160,
                height: compact ? 110 : 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.cyan.withValues(alpha: .2),
                      Colors.transparent,
                    ],
                  ),
                  border: Border.all(color: Colors.white.withValues(alpha: .1)),
                ),
                child: Icon(
                  banner.icon,
                  size: compact ? 58 : 90,
                  color: AppTheme.cyan.withValues(alpha: compact ? .3 : .8),
                ),
              ),
            ),
            PositionedDirectional(
              end: 18,
              bottom: 18,
              child: Icon(
                Icons.auto_awesome,
                size: compact ? 16 : 24,
                color: const Color(0xFFFFC775).withValues(alpha: .8),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(compact ? 16 : 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!compact) ...[
                    const Row(
                      children: [
                        SizedBox(
                          width: 18,
                          child: Divider(color: AppTheme.cyan, thickness: 2),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'YOUR EVERYDAY, UPGRADED',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.6,
                            color: AppTheme.cyan,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                  FractionallySizedBox(
                    widthFactor: compact ? .9 : .77,
                    child: Text(
                      banner.title,
                      style: TextStyle(
                        fontSize: compact ? 17 : 30,
                        height: 1.08,
                        fontWeight: FontWeight.w800,
                        letterSpacing: compact ? -.5 : -1,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  FractionallySizedBox(
                    widthFactor: compact ? .92 : .72,
                    child: Text(
                      banner.subtitle,
                      maxLines: compact ? 3 : 4,
                      style: TextStyle(
                        fontSize: compact ? 10 : 11,
                        height: 1.5,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  SizedBox(height: compact ? 16 : 20),
                  IgnorePointer(
                    child: FilledButton(
                      onPressed: () {},
                      style: compact
                          ? FilledButton.styleFrom(
                              foregroundColor: AppTheme.navy,
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 9,
                              ),
                              textStyle: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                              minimumSize: const Size(0, 32),
                            )
                          : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: Text(banner.action)),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward_rounded, size: 14),
                        ],
                      ),
                    ),
                  ),
                  if (!compact) ...[
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        ...List.generate(
                          4,
                          (index) => Container(
                            margin: const EdgeInsetsDirectional.only(end: 5),
                            width: index == 0 ? 20 : 5,
                            height: 4,
                            decoration: BoxDecoration(
                              color: index == 0
                                  ? AppTheme.cyan
                                  : Colors.white24,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          '01 / 04',
                          style: TextStyle(color: Colors.white54, fontSize: 8),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
