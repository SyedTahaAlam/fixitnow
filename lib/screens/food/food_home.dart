import 'package:flutter/material.dart';

import '../../data/mock_food.dart';
import '../shared/vertical_home_screen.dart';

class FoodHome extends StatelessWidget {
  const FoodHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: foodData);
}
