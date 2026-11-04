import 'package:flutter/material.dart';

import '../../data/mock_quick_mart.dart';
import '../shared/vertical_home_screen.dart';

class QuickMartHome extends StatelessWidget {
  const QuickMartHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: quickMartData);
}
