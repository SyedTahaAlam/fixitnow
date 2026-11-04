import 'package:flutter/material.dart';

import '../models/banner.dart';
import 'hero_banner.dart';

class PromoBannerPair extends StatelessWidget {
  const PromoBannerPair({
    super.key,
    required this.banners,
    required this.onTap,
  });
  final List<BannerData> banners;
  final ValueChanged<BannerData> onTap;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final width = constraints.maxWidth < 350
          ? constraints.maxWidth
          : (constraints.maxWidth - 12) / 2;
      return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: banners
            .map(
              (banner) => SizedBox(
                width: width,
                child: HeroBanner(
                  banner: banner,
                  compact: true,
                  onTap: () => onTap(banner),
                ),
              ),
            )
            .toList(),
      );
    },
  );
}
