import 'package:flutter/material.dart';

import '../../data/mock_intl_shopping.dart';
import '../shared/vertical_home_screen.dart';

class IntlShoppingHome extends StatelessWidget {
  const IntlShoppingHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: intlShoppingData);
}
