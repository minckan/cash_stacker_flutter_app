import 'package:cash_stacker_flutter_app/common/component/chart/ratio_chart.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          RatioChart(),
        ],
      ),
    );
  }
}
