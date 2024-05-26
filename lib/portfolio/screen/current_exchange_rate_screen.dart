import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/viewmodels/exchange_rate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentExchangeRateScreen extends ConsumerWidget {
  const CurrentExchangeRateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeRates = ref.watch(exchangeRateProvider);
    return DefaultLayout(
      title: '현재 환율',
      child: ListView.builder(
        itemBuilder: (context, index) {
          final exchageRate = exchangeRates[index];
          return ListTile(
            title: Text(exchageRate.cur_unit),
            subtitle: Text(exchageRate.deal_bas_r),
          );
        },
        itemCount: exchangeRates.length,
      ),
    );
  }
}
