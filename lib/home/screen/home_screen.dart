import 'package:cash_stacker_flutter_app/common/component/chart/annual_trend_chart.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/exchange_rate_view_model.dart';
import 'package:cash_stacker_flutter_app/home/screen/budget_setting_screen.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/asset_summary_view_model.dart';
import 'package:cash_stacker_flutter_app/home/viewmodels/workspace_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(exchangeRateProvider.notifier).loadExchangeRates();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final currentMonthKey = getMonth(DateTime.now());
    // ignore: unused_local_variable
    final assetSummaries = ref.watch(assetSummaryProvider);
    final assetSummaryVM = ref.read(assetSummaryProvider.notifier);
    final workspaceId = ref.read(workspaceViewModelProvider)?.id;

    final currentAssetSummary =
        assetSummaryVM.getAssetSummaryByMonth(currentMonthKey);

    if (currentAssetSummary == null) {
      return Container();
    }
    return DefaultLayout(
      isSliverView: true,
      actions: [
        IconButton(
          onPressed: () {
            print('알림 확인 메뉴');
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
        ),
      ],
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.primary,
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
                            addComma.format(currentAssetSummary.totalAssets),
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      Text(
                        assetSummaryVM.compareToLastMonthState(currentMonthKey),
                        style: const TextStyle(
                          fontFamily: 'Notosans',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '[${getMonth(DateTime.now())}] 목표 지출 및 잔여 예산',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    onPressed: () async {
                      final newSummary = await Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BudgetSettingScreen()));

                      if (workspaceId != null) {
                        assetSummaryVM.updateAssetSummary(
                            workspaceId, newSummary);
                      }
                    },
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightBackground2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (currentAssetSummary.monthlyBudget == 0)
                        const Center(
                            child: Text(
                          '아직 이번달 예산을 설정하지 않았어요!\n예산을 설정해주세요!',
                          textAlign: TextAlign.center,
                        ))
                      else ...[
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.chipViolet,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            child: Text(
                              '사용가능 예산',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              '₩',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  fontFamily: 'Roboto'),
                            ),
                            Text(
                              addComma.format(
                                  assetSummaryVM.currentExpendableBudget),
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 32,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${addComma.format(currentAssetSummary.monthlyBudget)}원 중 ${addComma.format(assetSummaryVM.monthlyExpenditure)}원을 사용했어요!',
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        LinearPercentIndicator(
                          percent: assetSummaryVM.budgetExpenditurePercentage,
                          progressColor: AppColors.primary,
                          lineHeight: 10,
                          alignment: MainAxisAlignment.start,
                          padding: EdgeInsets.zero,
                          width: MediaQuery.of(context).size.width - 80,
                          barRadius: const Radius.circular(10),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          assetSummaryVM.warningText,
                          style: const TextStyle(
                              height: 1.1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '월간 자산 규모 추이',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 50),
              const AnnualTrendChart(),
              const SizedBox(
                height: 120,
              )
            ],
          ),
        ),
      ),
    );
  }
}
