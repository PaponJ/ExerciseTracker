import 'package:fitness_tracker/pages/pedometer/widgets/stepTracker.dart';
import 'package:fitness_tracker/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class PedometerPage extends StatelessWidget {
  const PedometerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: step_tracker());
  }
}
