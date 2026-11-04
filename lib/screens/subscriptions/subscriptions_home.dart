import 'package:flutter/material.dart';

import '../../data/mock_subscriptions.dart';
import '../shared/vertical_home_screen.dart';

class SubscriptionsHome extends StatelessWidget {
  const SubscriptionsHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: subscriptionsData);
}
