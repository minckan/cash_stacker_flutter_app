import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/providers/exchange_rate_provider.dart';
import 'package:cash_stacker_flutter_app/swaggers/src/model/exchange_rate_response.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentExchangeRateScreen extends ConsumerStatefulWidget {
  const CurrentExchangeRateScreen({super.key});

  @override
  ConsumerState<CurrentExchangeRateScreen> createState() =>
      _CurrentExchangeRateScreenState();
}

class _CurrentExchangeRateScreenState
    extends ConsumerState<CurrentExchangeRateScreen> {
  late Future<List<ExchangeRateResponse>> _exchangeRatesFuture;

  @override
  void initState() {
    super.initState();
    _exchangeRatesFuture =
        ref.read(exchangeRateProvider.notifier).loadExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '현재 환율',
      child: FutureBuilder<List<ExchangeRateResponse>>(
        future: _exchangeRatesFuture,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final exchangeRate = snapshot.data![index];
                    return ListTile(
                      title: Text(exchangeRate.curUnit!),
                      subtitle: Text(exchangeRate.dealBasR!),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                return const Center(
                  child: Text('데이터가 없습니다.'),
                );
              }

            case ConnectionState.none:
            case ConnectionState.active:
            default:
              return const Center(
                child: Text('연결 중에 문제가 발생했습니다.'),
              );
          }
        },
      ),
    );
  }
}
