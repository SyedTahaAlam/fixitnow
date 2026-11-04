import 'package:flutter/material.dart';

import '../../data/mock_logistics.dart';
import '../shared/vertical_home_screen.dart';

class LogisticsHome extends StatelessWidget {
  const LogisticsHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: logisticsData);
}
