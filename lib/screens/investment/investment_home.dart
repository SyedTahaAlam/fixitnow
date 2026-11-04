import 'package:flutter/material.dart';

import '../../data/mock_investment.dart';
import '../shared/vertical_home_screen.dart';

class InvestmentHome extends StatelessWidget {
  const InvestmentHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: investmentData);
}
