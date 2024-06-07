import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/utill/input-formatter/decimal.dart';
import 'package:cash_stacker_flutter_app/common/utill/ui/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class NumberFormField extends StatelessWidget {
  final String formName;
  final String placeholder;
  final bool isOptional;
  final bool disabled;
  final String? suffixText;
  final bool addComma;
  final String? helperText;

  const NumberFormField(
      {super.key,
      required this.formName,
      required this.placeholder,
      this.isOptional = false,
      this.disabled = false,
      this.suffixText,
      this.addComma = true,
      this.helperText});

  @override
  Widget build(BuildContext context) {
    return FormFieldWithLabel(
      label: placeholder,
      helperText: helperText,
      formField: FormBuilderTextField(
        key: UniqueKey(),
        name: formName,
        enabled: !disabled,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [if (addComma) DecimalInputFormatter()],
        decoration: inputDecoration.copyWith(
          suffixIcon: suffixText != null
              ? Container(
                  padding: const EdgeInsets.only(right: 16.0),
                  alignment: Alignment.centerRight,
                  width: 10,
                  child: Text(suffixText!),
                )
              : null,
        ),
        textAlign: TextAlign.right,
        validator: FormBuilderValidators.compose([
          if (!isOptional) FormBuilderValidators.required(),
        ]),
      ),
    );
  }
}
