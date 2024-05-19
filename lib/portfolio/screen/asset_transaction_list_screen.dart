import 'package:cash_stacker_flutter_app/common/const/app_colors.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class AssetTransactionListScreen extends StatelessWidget {
  const AssetTransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '거래내역',
      child: ListView.builder(
        itemCount: 10 + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return buildListTile(
              context: context,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('총 118건'),
                    Text('실시간 기준'),
                  ],
                ),
              ),
            );
          }
          if (index == 1) {
            return buildListTile(
              context: context,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('총 금액'),
                    SizedBox(width: 10),
                    Text(
                      '3,999,999',
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                    SizedBox(width: 4),
                    Text('KRW'),
                  ],
                ),
              ),
            );
          }
          return buildListTile(
            context: context,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: const Text('24.05.06'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'KODEX 미국 30년 국채 울트라 선물(H)',
                          overflow: TextOverflow.clip,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('매도'),
                                Text('950'),
                              ],
                            ),
                            Text('주당 7,730'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('총 금액'),
                            Row(
                              children: [Text('7,343,500'), Text('KRW')],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildListTile(
      {required BuildContext context, required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border, width: 1),
        ),
      ),
      child: child,
    );
  }
}
