import 'package:cash_stacker_flutter_app/common/const/color.dart';
import 'package:flutter/material.dart';

class DailyLedger extends StatelessWidget {
  const DailyLedger({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return buildDailyContent();
      },
      itemCount: 10,
    );
  }

  Widget buildDailyContent() {
    const TextStyle normalStyle = TextStyle(
      color: DEEP_BODY_TEXT_COLOR,
      fontSize: 12,
    );
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: BORDER_COLOR),
              bottom: BorderSide(width: 1.0, color: BORDER_COLOR),
            ),
            color: LIGHT_BACKGROUND_COLOR,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '14',
                          style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 1),
                            child: Text('월요일',
                                style: normalStyle.copyWith(
                                    color: DEEP_BODY_TEXT_COLOR)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '200,000',
                          style: normalStyle.copyWith(color: INCOME_COLOR),
                        ),
                        const SizedBox(width: 50),
                        Text(
                          '500,000',
                          style: normalStyle.copyWith(color: EXPENSE_COLOR),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: BORDER_COLOR,
                ),
                ...List.generate(
                  3,
                  (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              const Text(
                                '식비🍣',
                                style: normalStyle,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '카드',
                                style: normalStyle.copyWith(
                                    color: DEEP_BODY_TEXT_COLOR),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '500,000',
                              style: normalStyle.copyWith(color: EXPENSE_COLOR),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
