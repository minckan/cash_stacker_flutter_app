import 'dart:io';

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
      actions: [
        IconButton(
          onPressed: () {
            print('현재 환율 확인');
          },
          icon: const Icon(
            Icons.currency_exchange,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            print('카테고리 수정 메뉴');
          },
          icon: const Icon(
            Icons.category_outlined,
            color: Colors.black,
          ),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.only(bottom: Platform.isIOS ? 96 : 0),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              RatioChart(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: PortfolioTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
