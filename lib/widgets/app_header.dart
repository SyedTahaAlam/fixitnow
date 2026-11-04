import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.onOpen});
  final void Function(String, IconData) onOpen;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(16, 15, 10, 14),
    child: LayoutBuilder(
      builder: (context, constraints) {
        final logo = Semantics(
          label: 'FixItNow',
          child: ExcludeSemantics(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'FixIt',
                  style: TextStyle(
                    fontSize: 24,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -1.6,
                  ),
                ),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFB44AFF), AppTheme.pink],
                  ).createShader(bounds),
                  child: const Text(
                    'Now',
                    style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        final location = InkWell(
          onTap: () => onOpen('Location: Riyadh', Icons.location_on_outlined),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.location_on_rounded, color: AppTheme.cyan, size: 18),
                SizedBox(width: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Riyadh \u25be',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Saudi Arabia',
                      style: TextStyle(color: AppTheme.cyan, fontSize: 8),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
        final wallet = InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => onOpen('Wallet', Icons.account_balance_wallet_outlined),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            decoration: BoxDecoration(
              color: AppTheme.cyan.withValues(alpha: .06),
              border: Border.all(color: AppTheme.cyan.withValues(alpha: .45)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: AppTheme.cyan,
                      size: 10,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Wallet',
                      style: TextStyle(fontSize: 8, color: AppTheme.cyan),
                    ),
                  ],
                ),
                Text(
                  'SAR 1,250.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
        final bell = IconButton(
          constraints: const BoxConstraints(minWidth: 32, minHeight: 44),
          padding: const EdgeInsets.all(7),
          tooltip: 'Notifications',
          onPressed: () =>
              onOpen('Notifications', Icons.notifications_outlined),
          icon: const Badge(
            smallSize: 6,
            backgroundColor: AppTheme.pink,
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        );
        if (constraints.maxWidth < 330 ||
            MediaQuery.textScalerOf(context).scale(12) > 16) {
          return Column(
            children: [
              Row(children: [logo, const Spacer(), bell]),
              const SizedBox(height: 8),
              Row(children: [location, const Spacer(), wallet]),
            ],
          );
        }
        return Row(
          children: [
            logo,
            const Spacer(),
            location,
            const Spacer(),
            wallet,
            bell,
          ],
        );
      },
    ),
  );
}
