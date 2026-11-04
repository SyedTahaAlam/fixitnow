import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TrustBadgeRow extends StatelessWidget {
  const TrustBadgeRow({super.key, required this.labels});
  final List<String> labels;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: const Color(0xFFEBEEF4)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        labels.length,
        (index) => Expanded(
          child: Column(
            children: [
              Icon(
                [
                  Icons.verified_user_outlined,
                  Icons.workspace_premium_outlined,
                  Icons.support_agent,
                ][index % 3],
                color: index == 1 ? AppTheme.pink : const Color(0xFF009D9E),
                size: 22,
              ),
              const SizedBox(height: 7),
              Text(
                labels[index],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 8,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
