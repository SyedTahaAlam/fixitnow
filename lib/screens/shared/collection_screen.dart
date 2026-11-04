import 'package:flutter/material.dart';

import '../../models/vertical.dart';
import '../../widgets/product_section.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key, required this.section});
  final HomeSection section;
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
      const SizedBox(height: 8),
      Text(section.title, style: Theme.of(context).textTheme.titleLarge),
      const SizedBox(height: 20),
      ProductSection(section: section, forceGrid: true),
    ],
  );
}
