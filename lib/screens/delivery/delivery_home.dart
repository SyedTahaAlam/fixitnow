import 'package:flutter/material.dart';

import '../../data/mock_delivery.dart';
import '../shared/vertical_home_screen.dart';

class DeliveryHome extends StatelessWidget {
  const DeliveryHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: deliveryData);
}
