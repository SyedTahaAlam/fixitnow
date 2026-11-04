import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../state/cart_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/countdown_label.dart';
import '../../widgets/placeholder_art.dart';
import '../../widgets/trust_badge_row.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back, size: 18),
          label: const Text('Back'),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 210,
          child: PlaceholderArt(
            icon: product.icon,
            color: product.color,
            size: 100,
          ),
        ),
      ),
      const SizedBox(height: 22),
      if (product.badge != null)
        Text(
          product.badge!,
          style: const TextStyle(
            color: AppTheme.pink,
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      if (product.countdownSeconds != null)
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: CountdownLabel(seconds: product.countdownSeconds!),
        ),
      const SizedBox(height: 8),
      Text(product.title, style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 8),
      Text(product.subtitle, style: const TextStyle(color: AppTheme.muted)),
      const SizedBox(height: 16),
      Text(
        product.price,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
      ),
      if (product.oldPrice != null)
        Text(
          product.oldPrice!,
          style: const TextStyle(
            color: AppTheme.muted,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      const SizedBox(height: 22),
      const Text(
        'About this listing',
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      ),
      const SizedBox(height: 8),
      Text(
        product.description,
        style: const TextStyle(color: AppTheme.muted, height: 1.8),
      ),
      const SizedBox(height: 24),
      FilledButton(
        key: const ValueKey('detail-primary-action'),
        onPressed: () {
          if (product.addToCart) context.read<CartProvider>().add(product);
          final message = product.addToCart
              ? 'Added'
              : ['Book', 'Rent', 'Enroll'].any(product.action.contains)
              ? 'Booked'
              : 'Done';
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('$message - offline demo only'),
                duration: const Duration(seconds: 2),
              ),
            );
        },
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Text(product.action),
        ),
      ),
      const SizedBox(height: 12),
      const Text(
        'Demo only. No transactions or bookings are processed.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 10, color: AppTheme.muted),
      ),
      const SizedBox(height: 24),
      const TrustBadgeRow(
        labels: ['Local preview', 'No payments', 'No data sent'],
      ),
    ],
  );
}
