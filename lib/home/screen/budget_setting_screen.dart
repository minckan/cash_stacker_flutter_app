import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class BudgetSettingScreen extends StatelessWidget {
  const BudgetSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '예산 설정 하기',
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('저장'),
        ),
      ],
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(),
          ],
        ),
      ),
    );
  }
}
