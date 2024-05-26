import 'dart:io';

import 'package:cash_stacker_flutter_app/common/component/chart/ratio_chart.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/model/exchange_rate_api_model.dart';
import 'package:cash_stacker_flutter_app/common/repository/exchange_rate_repository.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/portfolio_table.dart';
import 'package:cash_stacker_flutter_app/portfolio/screen/current_exchange_rate_screen.dart';
import 'package:cash_stacker_flutter_app/portfolio/viewmodel/asset_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPortfolioScreen extends ConsumerWidget {
  const MainPortfolioScreen({super.key});

//  dio.interceptors.add(CustomInterceptor(storage: storage));
  Future<List<ExchangeRateApiModel>> _getExchangeRates() async {
    final dio = Dio();

    final repository =
        ExchangeRateRepository(dio, baseUrl: dotenv.get('API_BASE_URL'));

    return repository.getCurrentExchangeRates();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetViewModelProvider).toList();
    final assetSummary = ref.read(assetSummaryProvider.notifier);
    final currentAssetSummary =
        assetSummary.getAssetSummaryByMonth(getMonth(DateTime.now()));

    return DefaultLayout(
      isSliverView: true,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const CurrentExchangeRateScreen()));
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
                            addComma.format(currentAssetSummary?.totalAssets),
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
            if (assets.isEmpty)
              Container(
                alignment: Alignment.center,
                height: 100,
                child: const Text('현재 보유중인 자산이 없습니다.'),
              )
            else ...[
              const RatioChart(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PortfolioTable(
                  assets: assets,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
