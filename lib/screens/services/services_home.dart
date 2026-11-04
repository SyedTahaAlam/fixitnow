import 'package:flutter/material.dart';

import '../../data/mock_services.dart';
import '../shared/vertical_home_screen.dart';

class ServicesHome extends StatelessWidget {
  const ServicesHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: servicesData);
}
