import 'package:cash_stacker_flutter_app/budget/model/budget_state.dart';
import 'package:cash_stacker_flutter_app/budget/screen/budget_list_screen.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/providers/asset_provider.dart';

import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/shared_preferences.dart';

import 'package:cash_stacker_flutter_app/budget/viewmodels/budget_view_model.dart';
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
    // ref.read(exchangeRateProvider.notifier).loadExchangeRates();
    _initState();
  }

  Future<void> _initState() async {
    final workspaceId = await SharedPreferencesUtil.getString(
        SharedPreferencesUtil.workspaceId);
    if (workspaceId != null) {
      await ref
          .read(budgetViewModelProvider.notifier)
          .loadActiveBudget(workspaceId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final workspaceId = ref.read(workspaceViewModelProvider)?.id;

    // final monthlyAssetTrendList = ref.watch(assetTrendProvider);

    // if (currentBudget == null || monthlyAsset == null) {
    //   return const Center(child: CircularProgressIndicator());
    // }

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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildAssetSummaryLayout(),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '목표 지출 및 잔여 예산',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    onPressed: () async {
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BudgetListScreen()));

                      if (workspaceId != null) {}
                    },
                  )
                ],
              ),
              _buildBudgetLayout(context),
              const SizedBox(height: 20),
              // const Text(
              //   '월간 자산 규모 추이',
              //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              // ),
              // const SizedBox(height: 50),
              // AnnualTrendChart(
              //   monthlyAssetTrendList: monthlyAssetTrendList,
              // ),
              // const SizedBox(
              //   height: 120,
              // )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildAssetSummaryLayout() {
    final currentMonthKey = getMonth(DateTime.now());
    final assetChangeMessage = ref
        .read(assetTrendProvider.notifier)
        .compareToLastMonthState(currentMonthKey);
    final monthlyAsset =
        ref.watch(thisMonthMonthlyAssetAmountProvider(currentMonthKey));
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 22),
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
                  addComma.format(monthlyAsset?.totalValue ?? 0),
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
              assetChangeMessage,
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
    );
  }

  Container _buildBudgetLayout(
    BuildContext context,
  ) {
    final budgetStat = ref.watch(budgetViewModelProvider);
    final budgetVM = ref.read(budgetViewModelProvider.notifier);

    // final activeBudget = budgetStat.activeBudget?.budget;
    // final expendableBudget = budgetStat.activeBudget?.expendableBudget;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackground2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (budgetStat is BudgetStatLoading)
              const Center(child: CircularProgressIndicator())
            else if (budgetStat is BudgetState &&
                budgetStat.activeBudget?.budget != null) ...[
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.chipViolet,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
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
                  const SizedBox(width: 10.0),
                  Text(
                    '${getDateKey(budgetStat.activeBudget!.budget!.startDate!)}부터~${getDateKey(budgetStat.activeBudget!.budget!.endDate!)}까지',
                    style: const TextStyle(fontSize: 11),
                  ),
                ],
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
                    addComma.format(budgetStat
                            .activeBudget?.expendableBudget?.expendableBudget ??
                        0),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
              Text(
                '${addComma.format(budgetStat.activeBudget!.budget!.amount)}원 중 ${addComma.format(budgetVM.expenseInBudget)}원을 사용했어요!', // assetSummaryViewModel.monthlyExpenditure
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              LinearPercentIndicator(
                percent: (double.tryParse(budgetStat
                            .activeBudget!.expendableBudget!.percentage
                            .toString()) ??
                        0) /
                    100,
                progressColor: AppColors.primary,
                lineHeight: 10,
                alignment: MainAxisAlignment.start,
                padding: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width - 80,
                barRadius: const Radius.circular(10),
              ),
              const SizedBox(height: 20),
              Text(
                budgetVM.warningText!,
                style: const TextStyle(
                    height: 1.1, fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ] else
              const Center(
                child: Text(
                  '활성가능한 예산이 없습니다.\n예산을 설정해주세요.',
                  textAlign: TextAlign.center,
                ),
              )
          ],
        ),
      ),
    );
  }
}
