import 'package:cash_stacker_flutter_app/ledger/screen/analystic_screen.dart';
import 'package:cash_stacker_flutter_app/ledger/screen/calender_screen.dart';
import 'package:cash_stacker_flutter_app/ledger/component/daily_ledger.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

class LedgerScreen extends StatefulWidget {
  const LedgerScreen({super.key});

  @override
  State<LedgerScreen> createState() => _LedgerScreenState();
}

class _LedgerScreenState extends State<LedgerScreen>
    with SingleTickerProviderStateMixin {
  // 페이지를 중간부터 보이도록 하기위해 24(2년)를 더한다.
  final PageController _pageController =
      PageController(initialPage: (DateTime.now().month - 1 + 24));

  late TabController tabController = TabController(length: 3, vsync: this);

  DateTime _currentDate = DateTime.now();
  bool selectedCurrentYear = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(),
        _buildTab(),
        _buildIndicators(),
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

              return _buildTabBarView();
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

  Widget _buildTabBarView() {
    return TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const DailyLedger(),
        CalenderScreen(today: _currentDate),
        const AnalyticsScreen()
      ],
    );
  }

  Widget _buildIndicators() {
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '수입',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(width: 4),
                Text(
                  '0',
                  style: numberStyle.copyWith(color: AppColors.income),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '지출',
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(width: 4),
                Text('0', style: numberStyle.copyWith(color: AppColors.expense))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '총합',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                const SizedBox(width: 4),
                Text('0', style: numberStyle)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
