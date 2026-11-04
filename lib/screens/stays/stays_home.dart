import 'package:flutter/material.dart';

import '../../data/mock_stays.dart';
import '../shared/vertical_home_screen.dart';

class StaysHome extends StatelessWidget {
  const StaysHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: staysData);
}
