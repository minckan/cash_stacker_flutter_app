import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/utill/ui/input.dart';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomTextFormField extends StatelessWidget {
  final String formName;
  final String placeholder;
  final bool disabled;
  final bool isOptional;

  const CustomTextFormField({
    super.key,
    required this.formName,
    required this.placeholder,
    this.disabled = false, // 기본 값을 설정
    this.isOptional = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormFieldWithLabel(
      label: placeholder,
      formField: FormBuilderTextField(
        key: UniqueKey(),
        name: formName,
        enabled: !disabled, // null이 아닌 값으로 처리됨
        decoration: inputDecoration,
        validator: FormBuilderValidators.compose([
          if (!isOptional) FormBuilderValidators.required(),
        ]),
      ),
    );
  }
}
