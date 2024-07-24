import 'package:cash_stacker_flutter_app/common/component/form/number_form_field.dart';
import 'package:flutter/material.dart';

class DomesticCashForm extends StatelessWidget {
  const DomesticCashForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NumberFormField(
          formName: 'balance',
          placeholder: '금액',
          suffixText: 'KWR',
        ),
      ],
    );
  }
}
