import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../state/cart_provider.dart';
import '../theme/app_theme.dart';
import 'countdown_label.dart';
import 'placeholder_art.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});
  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final saved = context.select<CartProvider, bool>(
      (cart) => cart.isSaved(product.id),
    );
    return Material(
      color: Colors.white,
      elevation: 1,
      shadowColor: AppTheme.navy.withValues(alpha: .12),
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFEBEEF4)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 116,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: PlaceholderArt(
                        icon: product.icon,
                        color: product.color,
                      ),
                    ),
                    if (product.badge != null)
                      PositionedDirectional(
                        start: 8,
                        top: 8,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 105),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.pink,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            product.badge!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 8,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    PositionedDirectional(
                      top: 2,
                      end: 1,
                      child: IconButton(
                        tooltip: saved
                            ? 'Unsave ${product.title}'
                            : 'Save ${product.title}',
                        onPressed: () => context
                            .read<CartProvider>()
                            .toggleSaved(product.id),
                        icon: Icon(
                          saved ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: saved ? AppTheme.pink : AppTheme.ink,
                        ),
                      ),
                    ),
                    if (product.countdownSeconds != null)
                      PositionedDirectional(
                        start: 7,
                        bottom: 6,
                        child: CountdownLabel(
                          seconds: product.countdownSeconds!,
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 34,
                      child: Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          height: 1.35,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      product.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFB648),
                          size: 14,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            product.meta,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppTheme.muted,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.price,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      height: 15,
                      child: Text(
                        product.oldPrice ??
                            (product.addToCart
                                ? 'Fast & reliable delivery'
                                : 'Verified on FixItNow'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 9,
                          color: AppTheme.muted,
                          decoration: product.oldPrice != null
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (product.addToCart)
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Add to cart',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                            width: 32,
                            child: FilledButton(
                              key: ValueKey('add-${product.id}'),
                              style: FilledButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              onPressed: () {
                                context.read<CartProvider>().add(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Added ${product.title}'),
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                              child: const Icon(Icons.add, size: 18),
                            ),
                          ),
                        ],
                      )
                    else
                      SizedBox(
                        width: double.infinity,
                        height: 32,
                        child: FilledButton(
                          onPressed: onTap,
                          child: Text(product.action, maxLines: 1),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
