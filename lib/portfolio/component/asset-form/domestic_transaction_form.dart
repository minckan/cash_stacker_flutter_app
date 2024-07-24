import 'package:cash_stacker_flutter_app/common/component/form/number_form_field.dart';
import 'package:cash_stacker_flutter_app/common/component/form/text_form_field.dart';

import 'package:flutter/material.dart';

class DomesticTransactionForm extends StatelessWidget {
  const DomesticTransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      CustomTextFormField(
        formName: 'name',
        placeholder: '종목명 입력',
      ),
      SizedBox(height: 10),
      NumberFormField(
        formName: 'pricePerShare',
        placeholder: '매입가',
        suffixText: 'KRW',
      ),
      SizedBox(
        width: 10,
      ),
      NumberFormField(
        formName: 'shares',
        placeholder: '수량',
      ),
      SizedBox(height: 10),
      NumberFormField(
        formName: 'currentPricePerShare',
        placeholder: '현재가',
        isOptional: true,
        suffixText: 'KRW',
      ),
    ]);
  }
}
