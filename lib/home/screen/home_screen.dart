import 'dart:io';

import 'package:cash_stacker_flutter_app/common/component/chart/bar_chart.dart';
import 'package:cash_stacker_flutter_app/common/const/color.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';

import 'package:flutter/material.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
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
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 20, right: 20, bottom: Platform.isIOS ? 96 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: PRIMARY_COLOR,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27, vertical: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total asset',
                        style: TextStyle(
                          fontFamily: 'Notosans',
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '30,540,000',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 27,
                      ),
                      Text(
                        '자산이 지난달 대비 10% 올랐어요!',
                        style: TextStyle(
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
                  const Text(
                    '5월 목표 지출 및 잔여 예산',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        size: 18,
                      ))
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: LIGHT_BACKGROUND_COLOR2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: TIP_FOR_LIGHT_BACKGROUND_COLOR,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 1),
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
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '₩',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                fontFamily: 'Roboto'),
                          ),
                          Text(
                            '250000',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        '1000000원 중 25000000원을 사용했어요!',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      LinearPercentIndicator(
                        percent: 0.5,
                        progressColor: PRIMARY_COLOR,
                        lineHeight: 10,
                        alignment: MainAxisAlignment.start,
                        padding: EdgeInsets.zero,
                        width: MediaQuery.of(context).size.width - 80,
                        barRadius: const Radius.circular(10),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '예산을 대부분 사용했어요!\n예산을 초과하지 않도록 주의해주세요!',
                        style: TextStyle(
                            height: 1.1,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '월간 자산 규모 추이',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20),
              BarChartSample1()
            ],
          ),
        ),
      ),
    );
  }
}
