import 'package:flutter/material.dart';

import '../../data/mock_jobs.dart';
import '../shared/vertical_home_screen.dart';

class JobsHome extends StatelessWidget {
  const JobsHome({super.key});

  @override
  Widget build(BuildContext context) =>
      const VerticalHomeScreen(vertical: jobsData);
}
