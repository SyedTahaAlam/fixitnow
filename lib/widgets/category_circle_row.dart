import 'package:flutter/material.dart';

import '../models/category.dart';
import '../theme/app_theme.dart';

class CategoryCircleRow extends StatelessWidget {
  const CategoryCircleRow({
    super.key,
    required this.categories,
    required this.onTap,
  });
  final List<Category> categories;
  final ValueChanged<Category> onTap;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 99,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (_, _) => const SizedBox(width: 9),
      itemBuilder: (context, index) {
        final category = categories[index];
        return InkWell(
          onTap: () => onTap(category),
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 65,
            child: Column(
              children: [
                Container(
                  width: 53,
                  height: 53,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: category.color.withValues(alpha: .09),
                    border: Border.all(
                      color: category.color.withValues(alpha: .09),
                    ),
                  ),
                  child: Icon(category.icon, size: 25, color: category.color),
                ),
                const SizedBox(height: 8),
                Text(
                  category.title,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 9,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.ink,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
