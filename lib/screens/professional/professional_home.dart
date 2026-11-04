import 'package:flutter/material.dart';

import '../../data/mock_professional.dart';
import '../shared/vertical_home_screen.dart';

class ProfessionalHome extends StatelessWidget {
  const ProfessionalHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: professionalData);
}
