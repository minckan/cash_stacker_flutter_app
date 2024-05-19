import 'dart:io';

import 'package:cash_stacker_flutter_app/common/component/chart/ratio_chart.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_table.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/asset_transaction_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_share/kakao_flutter_sdk_share.dart';

class MainPortfolioScreen extends StatelessWidget {
  const MainPortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      isSliverView: true,
      leading: IconButton(
        onPressed: () {
          print('현재 환율 확인');
        },
        icon: const Icon(
          Icons.currency_exchange,
          color: Colors.black,
        ),
      ),
      actions: [
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.chipViolet,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Total asset',
                        style: TextStyle(
                          fontFamily: 'Notosans',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            '₩',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            addComma.format(250000000),
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '전체 자산 비중과 자산 내역',
                style: TextStyle(
                  fontFamily: 'Notosans',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const RatioChart(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: PortfolioTable(),
            ),
            Container(
              height: 100,
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AssetTransactionListScreen(),
                    ),
                  );
                },
                child: const Text('거래내역 모두보기'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
