import 'package:flutter/material.dart';

import '../../navigation/destinations.dart';
import '../../theme/app_theme.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key, required this.destination, this.onBack});
  final AppDestination destination;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      if (onBack != null)
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: TextButton.icon(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back, size: 18),
            label: const Text('Back'),
          ),
        ),
      Expanded(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: AppTheme.pink.withValues(alpha: .07),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(destination.icon, color: AppTheme.pink, size: 48),
                ),
                const SizedBox(height: 24),
                Text(
                  destination.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Coming soon',
                  style: TextStyle(color: AppTheme.muted, fontSize: 15),
                ),
                const SizedBox(height: 18),
                const Text(
                  'A little more everyday magic is on its way.\nThis experience is a local, offline preview.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppTheme.muted,
                    fontSize: 11,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
