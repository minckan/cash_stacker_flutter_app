import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';

import 'package:cash_stacker_flutter_app/transactions/component/calender/calender.dart';
import 'package:cash_stacker_flutter_app/transactions/component/daily_transaction.dart';
import 'package:cash_stacker_flutter_app/transactions/model/transaction_state.dart';
import 'package:cash_stacker_flutter_app/transactions/providers/date_state.dart';
import 'package:cash_stacker_flutter_app/transactions/viewmodels/transactions_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class TransactionScreen extends ConsumerStatefulWidget {
  const TransactionScreen({super.key});

  @override
  ConsumerState<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends ConsumerState<TransactionScreen>
    with SingleTickerProviderStateMixin {
  // 페이지를 중간부터 보이도록 하기위해 24(2년)를 더한다.

  late TabController tabController = TabController(length: 3, vsync: this);

  bool selectedCurrentYear = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchTransactions(ref.read(dateProvider));
    });
  }

  Future<void> fetchTransactions(DateTime date) async {
    await ref.read(transactionStateProvider.notifier).loadMonthlyTransactions(
          date,
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(dateProvider, (prev, next) {
      // 날짜가 변경될때마다 api 호출하기.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        fetchTransactions(next);
      });
    });
    PageController pageController =
        PageController(initialPage: (ref.read(dateProvider).month - 1 + 24));
    DateTime currentDate = ref.watch(dateProvider);

    final financeState = ref.watch(transactionStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(currentDate: currentDate, pageController: pageController),
        _buildTab(),
        _buildIndicators(financeState),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: financeState is TransactionStateLoading
                ? const Center(child: CircularProgressIndicator())
                : financeState is TransactionStateError
                    ? Center(
                        child: Text(financeState.errorMessage),
                      )
                    : PageView.builder(
                        controller: pageController,
                        onPageChanged: (index) {
                          DateTime date =
                              DateTime(currentDate.year, (index % 12) + 1, 1);

                          setState(() {
                            ref.read(dateProvider.notifier).updateDate(date);
                          });
                        },
                        itemCount: 12 * 10,
                        itemBuilder: (context, pageIndex) {
                          // DateTime date =
                          //     DateTime(currentDate.year, (pageIndex % 12) + 1, 1);

                          return _buildTabBarView(currentDate);
                        },
                      ),
          ),
        )
      ],
    );
  }

  Widget _buildHeader({
    required DateTime currentDate,
    required PageController pageController,
  }) {
    bool isLastMonthOfYear = currentDate.month == 12;
    bool isFirstMonthOfYear = currentDate.month == 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
            ),
            onPressed: () {
              // Moves to the previous page if the current page index is greater than 0
              if (pageController.page! > 0) {
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );

                if (isFirstMonthOfYear) {
                  setState(() {
                    DateTime modifiedDateTime = DateTime(currentDate.year - 1,
                        currentDate.month, currentDate.day);

                    ref
                        .read(dateProvider.notifier)
                        .updateDate(modifiedDateTime);
                  });
                }
              }
            },
          ),
          // Displays the name of the current month
          Text(
            '${DateFormat('yyyy', 'ko').format(currentDate)}년 ${DateFormat('MMMM', 'ko').format(currentDate)}',
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'roboto'),
          ),
          IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
              if (isLastMonthOfYear) {
                setState(() {
                  DateTime modifiedDateTime = DateTime(
                      currentDate.year + 1, currentDate.month, currentDate.day);

                  ref.read(dateProvider.notifier).updateDate(modifiedDateTime);
                });
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTab() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      controller: tabController,
      labelColor: Colors.black87,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(color: AppColors.primary),
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
      ),
      tabs: const [
        Tab(
          text: "일별",
          height: 30,
        ),
        Tab(
          text: "달력",
          height: 30,
        ),
        Tab(
          text: "통계",
          height: 30,
        ),
      ],
    );
  }

  Widget _buildTabBarView(DateTime currentDate) {
    final transactionSummaries = ref
        .read(transactionStateProvider.notifier)
        .getMonthlyTransactionsInfo();
    return TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        DailyTransaction(
          transactionSummaries: transactionSummaries,
        ),
        Calender(
          today: currentDate,
          transactionSummaries: transactionSummaries,
        ),
        // const Analytics()
        const Padding(
          padding: EdgeInsets.all(30),
          child: Text('준비중 입니다.'),
        )
      ],
    );
  }

  Widget _buildIndicators(TransactionStateBase financeState) {
    final monthlyState =
        financeState is TransactionState ? financeState.monthlyResponse : null;
    TextStyle numberStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      fontFamily: 'Roboto',
    );
    return Container(
      height: 40,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: AppColors.border))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '수입',
                    style: TextStyle(fontSize: 10),
                  ),
                  // const SizedBox(width: 4),
                  Text(
                    addComma.format(monthlyState?.income ?? 0),
                    style: numberStyle.copyWith(color: AppColors.income),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '지출',
                    style: TextStyle(fontSize: 10),
                  ),
                  // const SizedBox(width: 4),
                  Text(addComma.format(monthlyState?.expense ?? 0),
                      style: numberStyle.copyWith(color: AppColors.expense))
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '합계',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  // const SizedBox(width: 4),
                  Text(addComma.format(monthlyState?.netTotal ?? 0),
                      style: numberStyle)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
