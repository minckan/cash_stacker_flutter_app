import 'package:flutter/material.dart';
import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

class CalenderScreen extends StatefulWidget {
  final DateTime today;
  const CalenderScreen({
    super.key,
    required this.today,
  });

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWeek(),
        _buildCalendar(widget.today),
      ],
    );
  }

  Widget _buildWeek() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildWeekDay(day: '일', textColor: AppColors.sunday),
          _buildWeekDay(day: '월'),
          _buildWeekDay(day: '화'),
          _buildWeekDay(day: '수'),
          _buildWeekDay(day: '목'),
          _buildWeekDay(day: '금'),
          _buildWeekDay(day: '토', textColor: AppColors.saturday),
        ],
      ),
    );
  }

  Widget _buildWeekDay({required String day, Color? textColor}) {
    return Container(
      width: MediaQuery.of(context).size.width / 7,
      alignment: Alignment.center,
      child: Text(
        day,
        style: TextStyle(color: textColor, fontSize: 10),
      ),
    );
  }

  Widget _buildCalendar(DateTime date) {
    // 월별 화면의 디테일을 계산
    int daysInMonth = DateTime(date.year, date.month + 1, 0).day;
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    int weekdayOfFirstDay = firstDayOfMonth.weekday;

    DateTime lastDayOfPreviousMonth =
        firstDayOfMonth.subtract(const Duration(days: 1));
    int daysInPreviousMonth = lastDayOfPreviousMonth.day;

    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7, childAspectRatio: 0.6),
        itemCount: daysInMonth + weekdayOfFirstDay % 7,
        itemBuilder: (context, index) {
          if (weekdayOfFirstDay < 7) {
            if (index < weekdayOfFirstDay) {
              int previousMonthDay =
                  daysInPreviousMonth - (weekdayOfFirstDay - index) + 1;

              return Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.lightGreyBackground,
                  ),
                  alignment: Alignment.center,
                  child: Text(previousMonthDay.toString(),
                      style: const TextStyle(color: Colors.grey)),
                ),
              );
            } else {
              DateTime dateTime = DateTime(
                  date.year, date.month, index - weekdayOfFirstDay + 1);
              String text = dateTime.day.toString();

              return InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.lightGreyBackground,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(text),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          } else {
            DateTime dateTime = DateTime(date.year, date.month, index + 1);
            String text = dateTime.day.toString();

            return InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.lightGreyBackground,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(text),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
