import 'package:flutter/material.dart';

import '../../data/mock_real_estate.dart';
import '../shared/vertical_home_screen.dart';

class RealEstateHome extends StatelessWidget {
  const RealEstateHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: realEstateData);
}
