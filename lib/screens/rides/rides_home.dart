import 'package:flutter/material.dart';

import '../../data/mock_rides.dart';
import '../shared/vertical_home_screen.dart';

class RidesHome extends StatelessWidget {
  const RidesHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: ridesData);
}
