import 'package:flutter/material.dart';

import '../../data/mock_pharmacy.dart';
import '../shared/vertical_home_screen.dart';

class PharmacyHome extends StatelessWidget {
  const PharmacyHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: pharmacyData);
}
