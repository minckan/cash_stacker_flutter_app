import 'package:cash_stacker_flutter_app/common/layout/default_layout.dart';
import 'package:cash_stacker_flutter_app/ledger/screen/ledger_screen.dart';
import 'package:flutter/material.dart';

class MainLedgerScreen extends StatelessWidget {
  const MainLedgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '',
      leading: IconButton(
        onPressed: () {
          print('기록 찾기 메뉴');
        },
        icon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print('카테고리 수정 메뉴');
          },
          icon: const Icon(
            Icons.category_outlined,
            color: Colors.black,
          ),
        ),
      ],
      child: const LedgerScreen(),
    );
  }
}
