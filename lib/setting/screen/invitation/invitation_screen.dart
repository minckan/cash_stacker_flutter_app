import 'package:cash_stacker_flutter_app/common/component/form/form_field_with_lable.dart';
import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/common/utill/ui/input.dart';
import 'package:cash_stacker_flutter_app/setting/model/invitation_model.dart';
import 'package:cash_stacker_flutter_app/setting/viewmodel/invitation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uuid/uuid.dart';

class InvitationScreen extends ConsumerWidget {
  const InvitationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormBuilderState>();
    final viewModel = ref.read(invitationViewModelProvider.notifier);
    Uuid uuid = const Uuid();
    return DefaultLayout(
      isFormView: true,
      title: '워크스페이스 공유',
      actions: [
        TextButton(
          onPressed: () async {
            if (formKey.currentState?.saveAndValidate() ?? false) {
              final value = formKey.currentState?.value;

              if (value != null) {
                showDialog(
                    context: (context),
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        //Dialog Main Title
                        title: const Column(
                          children: <Widget>[
                            Text("공유하기"),
                          ],
                        ),
                        //
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "확인 버튼을 누르면\n해당 이메일로 초대메일이 발송됩니다.",
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("확인"),
                            onPressed: () async {
                              final id = uuid.v4();

                              final email = value['email'];

                              final invitation = Invitation(
                                  id: id,
                                  email: email,
                                  workspaceId: '',
                                  status: InvitationStatus.pending,
                                  token: '',
                                  expiryDate: DateTime.now()
                                      .add(const Duration(days: 7)));

                              await viewModel.sendInvitation(invitation);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              }
            }
          },
          child: const Text(
            '초대하기',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                '현재 워크스페이스를 공유하고\n자산과 포트폴리오를 함께 관리해보세요',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              const SizedBox(height: 30),
              FormFieldWithLabel(
                key: UniqueKey(),
                label: 'e-mail',
                formField: FormBuilderTextField(
                    name: 'email',
                    decoration: inputDecoration,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: '이메일 주소를 입력해주세요'),
                      FormBuilderValidators.email(
                          errorText: '올바르지 않은 이메일주소 입니다'),
                    ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
