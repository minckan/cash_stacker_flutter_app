import 'package:cash_stacker_flutter_app/common/component/form/number_form_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/text_form_field.dart';
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:cash_stacker_flutter_app/common/providers/exchange_rate_provider.dart';
import 'package:cash_stacker_flutter_app/portfolio/component/asset-form/form-field/currency_selection_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForeignTransactionForm extends ConsumerWidget {
  const ForeignTransactionForm({
    super.key,
    required this.selectedCurrency,
  });

  final Currency? selectedCurrency;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencies = ref.watch(exchangeRateProvider).toList();
    return Column(children: [
      const CustomTextFormField(
        formName: 'name',
        placeholder: '종목명 입력',
      ),
      const SizedBox(height: 10),
      CurrencySelectionField(
          currencies: currencies,
          formName: '매수 통화',
          selectedCurrency: selectedCurrency,
          onSelect: (currency) {}),
      const SizedBox(height: 10),
      NumberFormField(
        formName: 'buyingPrice',
        placeholder: '매입가',
        suffixText: selectedCurrency?.currencyCode,
      ),
      const SizedBox(
        width: 10,
      ),
      NumberFormField(
        formName: 'exchangeRate',
        placeholder: '구매 환율',
        disabled: selectedCurrency?.currencyCode == null,
        suffixText: selectedCurrency?.currencyCode != null
            ? '/ 1 ${selectedCurrency?.currencyCode}'
            : '',
        addComma: false,
      ),
      const SizedBox(
        width: 10,
      ),
      const NumberFormField(
        formName: 'amount',
        placeholder: '수량',
      ),
      const SizedBox(height: 10),
      NumberFormField(
        formName: 'currentPrice',
        placeholder: '현재가',
        isOptional: true,
        suffixText: selectedCurrency?.currencyCode,
      ),
    ]);
  }
}
