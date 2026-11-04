import 'package:flutter/material.dart';

import '../../data/mock_catalog.dart';
import '../../models/vertical.dart';
import '../../navigation/app_router.dart';
import '../../navigation/destinations.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_header.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/vertical_switcher_bar.dart';
import '../vertical_home_registry.dart';
import 'placeholder_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  Vertical _vertical = verticals.first;
  int _tab = 0;
  bool _canPop = false;
  GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  void _reset(Vertical vertical, int tab) {
    FocusManager.instance.primaryFocus?.unfocus();
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    setState(() {
      _vertical = vertical;
      _tab = tab;
      _canPop = false;
      _navigator = GlobalKey<NavigatorState>();
    });
  }

  void _openUtility(String title, IconData icon) {
    _navigator.currentState!.push(
      MaterialPageRoute<void>(
        builder: (context) => PlaceholderScreen(
          destination: AppDestination(title, icon),
          onBack: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final destinations = destinationsFor(_vertical.id);
    return PopScope(
      canPop: !_canPop && _tab == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        if (_navigator.currentState!.canPop()) {
          _navigator.currentState!.pop();
        } else if (_tab != 0) {
          _reset(_vertical, 0);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppTheme.navy, _vertical.headerColor],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    AppHeader(onOpen: _openUtility),
                    VerticalSwitcherBar(
                      verticals: verticals,
                      selected: _vertical.id,
                      onSelected: (vertical) => _reset(vertical, 0),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SafeArea(
                top: false,
                bottom: false,
                child: Navigator(
                  key: _navigator,
                  observers: [
                    _StackObserver(() {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (!mounted) return;
                        final canPop =
                            _navigator.currentState?.canPop() ?? false;
                        if (_canPop != canPop) setState(() => _canPop = canPop);
                      });
                    }),
                  ],
                  onGenerateRoute: (settings) => AppRouter.generate(
                    settings,
                    _tab == 0
                        ? buildVerticalHome(_vertical)
                        : PlaceholderScreen(
                            destination: destinations[_tab],
                            onBack: () => _reset(_vertical, 0),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNav(
          destinations: destinations,
          selected: _tab,
          onTap: (tab) => _reset(_vertical, tab),
        ),
      ),
    );
  }
}

class _StackObserver extends NavigatorObserver {
  _StackObserver(this.onChanged);
  final VoidCallback onChanged;
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      onChanged();
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) =>
      onChanged();
}
