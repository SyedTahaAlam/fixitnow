import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../navigation/destinations.dart';
import '../state/cart_provider.dart';
import '../theme/app_theme.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.destinations,
    required this.selected,
    required this.onTap,
  });
  final List<AppDestination> destinations;
  final int selected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final count = context.select<CartProvider, int>((cart) => cart.count);
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppTheme.navy.withValues(alpha: .06),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selected,
        onTap: onTap,
        selectedItemColor: AppTheme.pink,
        unselectedItemColor: AppTheme.muted,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        backgroundColor: Colors.white,
        elevation: 0,
        items: destinations
            .map(
              (destination) => BottomNavigationBarItem(
                label: destination.title,
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 5),
                  child: destination.cart
                      ? Badge(
                          key: const ValueKey('cart-badge'),
                          isLabelVisible: count > 0,
                          label: Text('$count'),
                          backgroundColor: AppTheme.pink,
                          child: Icon(destination.icon, size: 23),
                        )
                      : destination.centerAction
                      ? Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected == destinations.indexOf(destination)
                                ? AppTheme.pink
                                : const Color(0xFF00A8DA),
                          ),
                          child: Icon(
                            destination.icon,
                            color: Colors.white,
                            size: 22,
                          ),
                        )
                      : Icon(destination.icon, size: 24),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
