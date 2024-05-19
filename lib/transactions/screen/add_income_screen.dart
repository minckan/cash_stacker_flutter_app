import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class AddIncomeScreen extends StatelessWidget {
  const AddIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: 'Add Income',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text('Add Income'),
      ),
    );
  }
}
