import 'package:flutter/material.dart';

import '../../data/mock_car_rental.dart';
import '../shared/vertical_home_screen.dart';

class CarRentalHome extends StatelessWidget {
  const CarRentalHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: carRentalData);
}
