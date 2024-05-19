import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class AddAssetScreen extends StatelessWidget {
  const AddAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: '자산 추가',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text('Add Assets'),
      ),
    );
  }
}
