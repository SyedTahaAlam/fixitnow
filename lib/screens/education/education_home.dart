import 'package:flutter/material.dart';

import '../../data/mock_education.dart';
import '../shared/vertical_home_screen.dart';

class EducationHome extends StatelessWidget {
  const EducationHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: educationData);
}
