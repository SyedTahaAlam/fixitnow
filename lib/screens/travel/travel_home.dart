import 'package:flutter/material.dart';

import '../../data/mock_travel.dart';
import '../shared/vertical_home_screen.dart';

class TravelHome extends StatelessWidget {
  const TravelHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: travelData);
}
