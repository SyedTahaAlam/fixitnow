import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.hint,
    this.onChanged,
    this.onFilter,
  });
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilter;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFE9EDF3)),
      boxShadow: [
        BoxShadow(
          color: AppTheme.navy.withValues(alpha: .035),
          blurRadius: 14,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: TextField(
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 11, color: AppTheme.muted),
        filled: false,
        prefixIcon: const Icon(
          Icons.search_rounded,
          size: 22,
          color: AppTheme.ink,
        ),
        suffixIcon: IconButton(
          tooltip: 'Search filters',
          onPressed: onFilter,
          icon: const Icon(Icons.tune_rounded, size: 20, color: AppTheme.ink),
        ),
      ),
    ),
  );
}
