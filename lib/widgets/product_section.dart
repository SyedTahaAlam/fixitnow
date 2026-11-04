import 'package:flutter/material.dart';

import '../models/vertical.dart';
import '../navigation/app_router.dart';
import 'market_card.dart';
import 'product_card.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({
    super.key,
    required this.section,
    this.forceGrid = false,
  });
  final HomeSection section;
  final bool forceGrid;

  @override
  Widget build(BuildContext context) {
    final scale = MediaQuery.textScalerOf(context).scale(14) / 14;
    final height = 306.0 + (scale - 1).clamp(0, 3) * 180;
    final market = section.layout == SectionLayout.markets;
    Widget card(int index) {
      final item = section.items[index];
      return market
          ? MarketCard(
              product: item,
              onTap: () => AppRouter.openProduct(context, item),
            )
          : ProductCard(
              product: item,
              onTap: () => AppRouter.openProduct(context, item),
            );
    }

    if (forceGrid || section.layout == SectionLayout.grid || market) {
      return LayoutBuilder(
        builder: (context, constraints) => GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: section.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth >= 700
                ? 4
                : constraints.maxWidth < 285
                ? 1
                : 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            mainAxisExtent: market
                ? 153 + (scale - 1).clamp(0, 3) * 80
                : height,
          ),
          itemBuilder: (_, index) => card(index),
        ),
      );
    }
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: section.items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (_, index) => SizedBox(width: 170, child: card(index)),
      ),
    );
  }
}
