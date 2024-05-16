import 'package:cash_stacker_flutter_app/common/component/chart/ratio_chart.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_table.dart';
import 'package:flutter/material.dart';

class MainPortfolioScreen extends StatelessWidget {
  const MainPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      child: Container(
        child: const Column(
          children: [
            // RatioChart(),
            PortfolioTable(),
          ],
        ),
      ),
    );
  }
}
