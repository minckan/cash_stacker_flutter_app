import 'package:cash_stacker_flutter_app/common/utill/date_format.dart';
import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:cash_stacker_flutter_app/common/utill/number_format.dart';
import 'package:cash_stacker_flutter_app/transactions/component/analystic.dart';
import 'package:cash_stacker_flutter_app/transactions/component/calender/calender.dart';
import 'package:cash_stacker_flutter_app/transactions/component/daily_transaction.dart';
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
  final PageController _pageController =
      PageController(initialPage: (DateTime.now().month - 1 + 24));

  late TabController tabController = TabController(length: 3, vsync: this);

  DateTime _currentDate = DateTime.now();
  bool selectedCurrentYear = false;

  @override
  Widget build(BuildContext context) {
    // 리빌드를 위해 watch
    // ignore: unused_local_variable
    final transactions = ref.watch(transactionViewModelProvider);
    final transactionViewModel =
        ref.read(transactionViewModelProvider.notifier);

    String yearMonth = getMonth(_currentDate);
    List<Map<String, dynamic>> monthTransactions =
        transactionViewModel.getMonthTransactions(yearMonth);
    Map<String, double>? currentMonthTotals =
        transactionViewModel.currentMonthTotal(_currentDate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(),
        _buildTab(),
        _buildIndicators(currentMonthTotals),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              DateTime date = DateTime(_currentDate.year, (index % 12) + 1, 1);

              setState(() {
                _currentDate = date;
              });
            },
            itemCount: 12 * 10,
            itemBuilder: (context, pageIndex) {
              DateTime date =
                  DateTime(_currentDate.year, (pageIndex % 12) + 1, 1);

              return _buildTabBarView(monthTransactions);
            },
          ),
        )
      ],
    );
  }

  Widget _buildHeader() {
    bool isLastMonthOfYear = _currentDate.month == 12;
    bool isFirstMonthOfYear = _currentDate.month == 1;

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
              if (_pageController.page! > 0) {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );

                if (isFirstMonthOfYear) {
                  setState(() {
                    DateTime modifiedDateTime = DateTime(_currentDate.year - 1,
                        _currentDate.month, _currentDate.day);

                    _currentDate = modifiedDateTime;
                  });
                }
              }
            },
          ),
          // Displays the name of the current month
          Text(
            '${DateFormat('yyyy', 'ko').format(_currentDate)}년 ${DateFormat('MMMM', 'ko').format(_currentDate)}',
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
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
              if (isLastMonthOfYear) {
                setState(() {
                  DateTime modifiedDateTime = DateTime(_currentDate.year + 1,
                      _currentDate.month, _currentDate.day);

                  _currentDate = modifiedDateTime;
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

  Widget _buildTabBarView(List<Map<String, dynamic>> transactions) {
    return TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        DailyTransaction(
          transactions: transactions,
        ),
        Calender(
          today: _currentDate,
          transactions: transactions,
        ),
        const Analytics()
      ],
    );
  }

  Widget _buildIndicators(Map<String, double>? monthlyTotal) {
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
                    addComma.format(
                        monthlyTotal != null ? monthlyTotal['income'] : 0),
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
                  Text(
                      addComma.format(
                          monthlyTotal != null ? monthlyTotal['expanse'] : 0),
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
                  Text(
                      addComma.format(
                          monthlyTotal != null ? monthlyTotal['netIncome'] : 0),
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
