import 'package:flutter/material.dart';

import '../../data/mock_auctions.dart';
import '../shared/vertical_home_screen.dart';

class AuctionsHome extends StatelessWidget {
  const AuctionsHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: auctionsData);
}
