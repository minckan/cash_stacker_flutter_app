import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: '지출 추가하기',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text('Add Expense'),
      ),
    );
  }
}
