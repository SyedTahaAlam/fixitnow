import 'package:flutter/material.dart';

import '../models/product.dart';
import '../screens/shared/detail_screen.dart';
import '../screens/shared/placeholder_screen.dart';
import 'destinations.dart';

abstract final class AppRouter {
  static const detail = '/detail';
  static const placeholder = '/placeholder';

  static void openProduct(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(detail, arguments: product);
  }

  static Route<dynamic> generate(RouteSettings settings, Widget home) {
    final Widget page = switch (settings.name) {
      '/' => home,
      detail => DetailScreen(product: settings.arguments as Product),
      placeholder => Builder(
        builder: (context) => PlaceholderScreen(
          destination: settings.arguments as AppDestination,
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
      _ => throw StateError('Unknown local route: ${settings.name}'),
    };
    return MaterialPageRoute<void>(settings: settings, builder: (_) => page);
  }
}
