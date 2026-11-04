import 'package:flutter/material.dart';

import '../../data/mock_buy_sell.dart';
import '../shared/vertical_home_screen.dart';

class BuySellHome extends StatelessWidget {
  const BuySellHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: buySellData);
}
