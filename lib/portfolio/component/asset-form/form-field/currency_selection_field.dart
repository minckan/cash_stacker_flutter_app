import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/model/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:cash_stacker_flutter_app/common/utill/ui/input.dart';

// TODO: 모달을 다시 띄웠을때 선택한 아이템이 선택되어 있도록 수정
class CurrencySelectionField extends StatelessWidget {
  final List<Currency> currencies;
  final String formName;
  final Currency? selectedCurrency;
  final Function(Currency?) onSelect;

  const CurrencySelectionField({
    super.key,
    required this.currencies,
    required this.formName,
    required this.selectedCurrency,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    bool disabled = false;
    return FormFieldWithLabel(
      label: '구매통화',
      formField: FormBuilderTextField(
        key: UniqueKey(),
        name: 'currency',
        enabled: !disabled,
        decoration: inputDecoration.copyWith(
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        readOnly: true,
        onTap: () {
          showCupertinoModalPopup(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 250,
                color: Colors.white,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 32,
                  onSelectedItemChanged: (int index) {},
                  children: List<Widget>.generate(
                    currencies.length,
                    (int index) {
                      return GestureDetector(
                        onTap: () => onSelect(currencies[index]),
                        child: Center(
                          child: Text(
                              '${currencies[index].currencyName} - ${currencies[index].currencyCode}'),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
