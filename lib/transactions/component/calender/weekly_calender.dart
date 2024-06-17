import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';

import 'package:flutter/material.dart';

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({
    super.key,
    required this.selectedDate,
    required this.handleChangeSelectDate,
  });

  @override
  State<WeeklyCalendar> createState() => _WeeklyCalendarState();

  final DateTime selectedDate;
  final void Function(DateTime) handleChangeSelectDate;
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  late DateTime _startOfWeek;

  @override
  void initState() {
    super.initState();
    _startOfWeek = _findStartOfWeek(widget.selectedDate);
  }

  DateTime _findStartOfWeek(DateTime date) {
    // Calculate the start of the week (Monday)
    return date.subtract(Duration(days: date.weekday - 1));
  }

  void _previousWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.subtract(const Duration(days: 7));
      widget.handleChangeSelectDate(
          widget.selectedDate.subtract(const Duration(days: 7)));
    });
  }

  void _nextWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.add(const Duration(days: 7));
      widget.handleChangeSelectDate(
          widget.selectedDate.add(const Duration(days: 7)));
    });
  }

  Future<void> _selectDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      initialDate: widget.selectedDate,
    );

    if (picked != null && picked != widget.selectedDate) {
      setState(() {
        widget.handleChangeSelectDate(picked);
        _startOfWeek = _findStartOfWeek(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> days = List.generate(7, (index) {
      return _startOfWeek.add(Duration(days: index));
    });

    final selectedMonth =
        '${widget.selectedDate.year}년 ${widget.selectedDate.month}월';
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1, // Spread radius를 줄여서 그림자의 크기를 줄입니다.
            blurRadius: 3, // Blur radius를 줄여서 그림자의 흐림 정도를 줄입니다.
            offset: const Offset(
                0, 4), // x값을 0으로 두고 y값을 2로 하여 아래로 약간 그림자가 생기도록 합니다.
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _selectDatePicker(context),
                    child: Text(
                      selectedMonth,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffEFEFEF),
                        ),
                        child: GestureDetector(
                          onTap: _previousWeek,
                          child: const Icon(
                            Icons.chevron_left,
                            size: 24,
                            color: Color(0xff343330),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xffEFEFEF),
                        ),
                        child: GestureDetector(
                          onTap: _nextWeek,
                          child: const Icon(
                            Icons.chevron_right,
                            size: 24,
                            color: Color(0xff343330),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildWeekday(),
            const Divider(
              color: Color(0xffEBEBEB),
            ),
            _buildCalendarView(
                days: days,
                selectedDate: widget.selectedDate,
                onSelectDate: (selectedDate) {
                  setState(() {
                    widget.handleChangeSelectDate(selectedDate);
                  });
                }),
          ],
        ),
      ),
    );
  }

  GridView _buildCalendarView({
    required List<DateTime> days,
    required DateTime selectedDate,
    required void Function(DateTime date) onSelectDate,
  }) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
      ),
      itemBuilder: (context, index) {
        DateTime day = days[index];
        bool isToday = day.day == selectedDate.day &&
            day.month == selectedDate.month &&
            day.year == selectedDate.year;

        // bool isNextMonthDay =
        return InkWell(
          onTap: () => onSelectDate(day),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: isToday ? AppColors.primary : null,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  day.day.toString(),
                  style: TextStyle(
                    color: isToday ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  GridView _buildWeekday() {
    final List<String> weekdays = ["월", "화", "수", "목", "금", "토", "일"];
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: weekdays.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Text(
            weekdays[index],
            style: TextStyle(
              color: index == 5
                  ? AppColors.saturday
                  : index == 6
                      ? AppColors.sunday
                      : Colors.black,
            ),
          ),
        );
      },
    );
  }
}
