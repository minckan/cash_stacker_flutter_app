import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for ExchangeRateApi
void main() {
  final instance = Openapi().getExchangeRateApi();

  group(ExchangeRateApi, () {
    // Fetch exchange rates
    //
    // Retrieve the latest exchange rates.
    //
    //Future<BuiltList<ExchangeRateResponse>> apiExchangeRatesGet() async
    test('test apiExchangeRatesGet', () async {
      // TODO
    });

  });
}
